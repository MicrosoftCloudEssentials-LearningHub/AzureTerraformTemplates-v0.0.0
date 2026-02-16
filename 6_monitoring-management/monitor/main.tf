# main.tf
# Creates an Azure Monitor Action Group (email receiver).

data "azurerm_client_config" "current" {}
data "azuread_client_config" "current" {}

data "azuread_user" "current" {
  count     = var.use_current_user_as_admin && length(var.admin_members) == 0 && trimspace(var.email_address != null ? var.email_address : "") == "" ? 1 : 0
  object_id = data.azuread_client_config.current.object_id
}

resource "azapi_resource" "resource_group" {
  type      = "Microsoft.Resources/resourceGroups@2022-09-01"
  name      = var.resource_group_name
  location  = var.location
  parent_id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}"

  body = jsonencode({
    tags = var.tags
  })

  response_export_values = [
    "id",
    "name"
  ]
}

resource "random_string" "suffix" {
  length  = var.random_suffix_length
  upper   = false
  special = false
  numeric = true

  keepers = {
    resource_group_name = var.resource_group_name
    location            = var.location
    base_name           = var.action_group_name
    short_name          = var.action_group_short_name
    email               = trimspace(var.email_address != null ? var.email_address : "")
  }
}

locals {
  action_group_name = var.append_random_suffix ? "${var.action_group_name}-${random_string.suffix.result}" : var.action_group_name

  current_user_upn = try(data.azuread_user.current[0].user_principal_name, null)

  email_address_normalized = trimspace(var.email_address != null ? var.email_address : "")

  admin_members_effective = (
    length(var.admin_members) > 0
    ? var.admin_members
    : (
      local.email_address_normalized != ""
      ? [local.email_address_normalized]
      : (
        var.use_current_user_as_admin && local.current_user_upn != null
        ? [local.current_user_upn]
        : []
      )
    )
  )

  email_recipients = distinct([
    for email in local.admin_members_effective : lower(trimspace(email))
    if trimspace(email) != ""
  ])

  email_receivers = { for idx, email in local.email_recipients : "email${idx}" => email }
}

resource "azurerm_monitor_action_group" "ag" {
  name                = local.action_group_name
  resource_group_name = var.resource_group_name
  short_name          = var.action_group_short_name

  enabled = true

  dynamic "email_receiver" {
    for_each = local.email_receivers
    content {
      name                    = email_receiver.key
      email_address           = email_receiver.value
      use_common_alert_schema = var.use_common_alert_schema
    }
  }

  tags = var.tags

  depends_on = [
    azapi_resource.resource_group
  ]

  lifecycle {
    precondition {
      condition     = length(local.email_recipients) > 0
      error_message = "No email recipients configured. Set admin_members, email_address, or enable use_current_user_as_admin."
    }
  }
}
