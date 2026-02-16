# main.tf
# Creates an Azure Log Analytics workspace.

data "azurerm_client_config" "current" {}
data "azuread_client_config" "current" {}

data "azuread_user" "current" {
  count     = var.use_current_user_as_admin && length(var.admin_members) == 0 ? 1 : 0
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
    workspace_base      = var.workspace_name
    sku                 = var.sku
  }
}

locals {
  workspace_name = var.append_random_suffix ? "${var.workspace_name}-${random_string.suffix.result}" : var.workspace_name
}

resource "azurerm_log_analytics_workspace" "law" {
  name                = local.workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku               = var.sku
  retention_in_days = var.retention_in_days
  daily_quota_gb    = var.daily_quota_gb

  tags = var.tags

  depends_on = [
    azapi_resource.resource_group
  ]
}

locals {
  current_user_upn = try(data.azuread_user.current[0].user_principal_name, null)
  admin_upns_list = (
    length(var.admin_members) > 0
    ? var.admin_members
    : (
      var.use_current_user_as_admin && local.current_user_upn != null
      ? [local.current_user_upn]
      : []
    )
  )
  admin_upns = toset([for upn in local.admin_upns_list : trimspace(upn) if trimspace(upn) != ""])
}

data "azuread_user" "admins" {
  for_each            = local.admin_upns
  user_principal_name = each.value
}

data "azurerm_role_definition" "admin_role" {
  name  = var.admin_role_definition_name
  scope = azurerm_log_analytics_workspace.law.id
}

resource "azurerm_role_assignment" "law_admins" {
  for_each = data.azuread_user.admins

  scope              = azurerm_log_analytics_workspace.law.id
  role_definition_id = data.azurerm_role_definition.admin_role.id
  principal_id       = each.value.object_id
}
