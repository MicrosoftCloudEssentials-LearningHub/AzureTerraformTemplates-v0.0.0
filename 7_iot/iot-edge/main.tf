data "azurerm_client_config" "current" {}

resource "azapi_resource_action" "register_deviceupdate" {
  count = var.register_deviceupdate_resource_provider ? 1 : 0

  type        = "Microsoft.Resources/providers@2021-04-01"
  resource_id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/providers/Microsoft.DeviceUpdate"
  action      = "register"
  method      = "POST"

  response_export_values = [
    "registrationState"
  ]
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
    iothub_base_name    = var.iothub_name
    dua_base_name       = var.device_update_account_name
  }
}

locals {
  suffix                    = var.append_random_suffix ? random_string.suffix.result : ""
  iothub_name_final         = var.append_random_suffix ? "${var.iothub_name}-${local.suffix}" : var.iothub_name
  device_update_account_raw = var.append_random_suffix ? "${var.device_update_account_name}-${local.suffix}" : var.device_update_account_name
}

resource "azurerm_iothub" "hub" {
  name                = local.iothub_name_final
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    name     = var.iothub_sku_name
    capacity = var.iothub_sku_capacity
  }

  tags = var.tags

  depends_on = [
    azapi_resource.resource_group
  ]
}

resource "azurerm_iothub_device_update_account" "dua" {
  name                = local.device_update_account_raw
  location            = var.location
  resource_group_name = var.resource_group_name

  dynamic "identity" {
    for_each = var.enable_device_update_system_assigned_identity ? [1] : []
    content {
      type = "SystemAssigned"
    }
  }

  tags = var.tags

  depends_on = [
    azapi_resource.resource_group,
    azapi_resource_action.register_deviceupdate
  ]
}

resource "azurerm_iothub_device_update_instance" "instance" {
  name                     = var.device_update_instance_name
  device_update_account_id = azurerm_iothub_device_update_account.dua.id
  iothub_id                = azurerm_iothub.hub.id

  depends_on = [
    azurerm_iothub.hub,
    azurerm_iothub_device_update_account.dua
  ]
}
