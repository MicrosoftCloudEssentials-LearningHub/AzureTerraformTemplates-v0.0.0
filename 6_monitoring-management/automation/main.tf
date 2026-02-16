# main.tf
# Creates an Azure Automation Account.

data "azurerm_client_config" "current" {}

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
    base_name           = var.automation_account_name
    sku                 = var.sku_name
  }
}

locals {
  automation_account_name = var.append_random_suffix ? "${var.automation_account_name}-${random_string.suffix.result}" : var.automation_account_name
}

resource "azurerm_automation_account" "aa" {
  name                = local.automation_account_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name

  dynamic "identity" {
    for_each = var.enable_system_assigned_identity ? [1] : []
    content {
      type = "SystemAssigned"
    }
  }

  tags = var.tags

  depends_on = [
    azapi_resource.resource_group
  ]
}
