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
    base_name           = var.cognitive_account_name
    kind                = var.kind
    sku                 = var.sku_name
  }
}

locals {
  suffix   = var.append_random_suffix ? random_string.suffix.result : ""
  name_raw = var.append_random_suffix ? "${var.cognitive_account_name}-${local.suffix}" : var.cognitive_account_name
}

resource "azurerm_cognitive_account" "cog" {
  name                = local.name_raw
  location            = var.location
  resource_group_name = var.resource_group_name

  kind     = var.kind
  sku_name = var.sku_name

  custom_subdomain_name         = var.custom_subdomain_name
  public_network_access_enabled = var.public_network_access_enabled

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
