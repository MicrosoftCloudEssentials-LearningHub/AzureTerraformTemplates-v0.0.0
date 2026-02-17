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
    base_name           = var.search_service_name
    sku                 = var.sku
  }
}

locals {
  suffix         = var.append_random_suffix ? random_string.suffix.result : ""
  name_raw       = lower(var.append_random_suffix ? "${var.search_service_name}-${local.suffix}" : var.search_service_name)
  name_sanitized = substr(join("", regexall("[a-z0-9-]", local.name_raw)), 0, 60)
}

resource "azurerm_search_service" "search" {
  name                = local.name_sanitized
  resource_group_name = var.resource_group_name
  location            = var.location

  sku             = var.sku
  replica_count   = var.replica_count
  partition_count = var.partition_count

  public_network_access_enabled = var.public_network_access_enabled
  local_authentication_enabled  = var.local_authentication_enabled

  tags = var.tags

  depends_on = [
    azapi_resource.resource_group
  ]
}
