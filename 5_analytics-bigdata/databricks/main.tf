# main.tf
# Creates an Azure Databricks workspace.

data "azurerm_client_config" "current" {}

# Resource group creation is idempotent in ARM (PUT). This will create the RG if it doesn't exist,
# or update tags if it already exists.
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
    workspace_base      = var.databricks_workspace_name
    sku                 = lower(var.sku)
    managed_rg_base     = coalesce(var.managed_resource_group_name, "rg-databricks-managed-${var.databricks_workspace_name}")
  }
}

locals {
  suffix = var.append_random_suffix ? random_string.suffix.result : ""

  workspace_name = var.append_random_suffix ? "${var.databricks_workspace_name}-${local.suffix}" : var.databricks_workspace_name

  managed_rg_name = (
    var.managed_resource_group_name == null
    ? null
    : (var.append_random_suffix ? "${var.managed_resource_group_name}-${local.suffix}" : var.managed_resource_group_name)
  )
}

resource "azurerm_databricks_workspace" "ws" {
  name                = local.workspace_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = lower(var.sku)

  managed_resource_group_name = local.managed_rg_name

  tags = var.tags

  depends_on = [
    azapi_resource.resource_group
  ]
}
