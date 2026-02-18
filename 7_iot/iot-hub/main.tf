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
    base_name           = var.iothub_name
    sku                 = var.sku_name
  }
}

locals {
  suffix   = var.append_random_suffix ? random_string.suffix.result : ""
  name_raw = var.append_random_suffix ? "${var.iothub_name}-${local.suffix}" : var.iothub_name
}

resource "azurerm_iothub" "hub" {
  name                = local.name_raw
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    name     = var.sku_name
    capacity = var.sku_capacity
  }

  public_network_access_enabled = var.public_network_access_enabled
  local_authentication_enabled  = var.local_authentication_enabled
  event_hub_partition_count     = var.event_hub_partition_count
  event_hub_retention_in_days   = var.event_hub_retention_in_days
  min_tls_version               = var.min_tls_version

  tags = var.tags

  depends_on = [
    azapi_resource.resource_group
  ]
}
