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
    iothub_base_name    = var.iothub_name
    tsi_base_name       = var.tsi_environment_name
  }
}

locals {
  suffix                = var.append_random_suffix ? random_string.suffix.result : ""
  iothub_name_final     = var.append_random_suffix ? "${var.iothub_name}-${local.suffix}" : var.iothub_name
  tsi_environment_final = var.append_random_suffix ? "${var.tsi_environment_name}-${local.suffix}" : var.tsi_environment_name
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

resource "azurerm_iothub_consumer_group" "tsi" {
  name                   = var.iothub_consumer_group_name
  iothub_name            = azurerm_iothub.hub.name
  resource_group_name    = var.resource_group_name
  eventhub_endpoint_name = var.iothub_eventhub_endpoint_name
}

resource "azurerm_iothub_shared_access_policy" "tsi" {
  name                = var.iothub_sas_policy_name
  resource_group_name = var.resource_group_name
  iothub_name         = azurerm_iothub.hub.name

  service_connect = true
}

resource "azurerm_iot_time_series_insights_standard_environment" "env" {
  name                = local.tsi_environment_final
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name            = var.tsi_sku_name
  data_retention_time = var.tsi_data_retention_time

  tags = var.tags

  depends_on = [
    azapi_resource.resource_group
  ]
}

resource "azurerm_iot_time_series_insights_event_source_iothub" "es" {
  name           = var.tsi_event_source_name
  location       = var.location
  environment_id = azurerm_iot_time_series_insights_standard_environment.env.id

  event_source_resource_id = azurerm_iothub.hub.id
  iothub_name              = azurerm_iothub.hub.name
  consumer_group_name      = azurerm_iothub_consumer_group.tsi.name

  shared_access_key_name = azurerm_iothub_shared_access_policy.tsi.name
  shared_access_key      = azurerm_iothub_shared_access_policy.tsi.primary_key
}

resource "azurerm_iot_time_series_insights_access_policy" "access" {
  count = var.access_policy_principal_object_id == null ? 0 : 1

  name = var.access_policy_name

  time_series_insights_environment_id = azurerm_iot_time_series_insights_standard_environment.env.id
  principal_object_id                 = var.access_policy_principal_object_id
  roles                               = var.access_policy_roles
}
