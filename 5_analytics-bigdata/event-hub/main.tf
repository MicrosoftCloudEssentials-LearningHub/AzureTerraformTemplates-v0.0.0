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
    namespace_base      = var.eventhub_namespace_name
    eventhub_name       = var.eventhub_name
    sku                 = var.sku
    capacity            = tostring(var.capacity)
  }
}

locals {
  suffix = var.append_random_suffix ? random_string.suffix.result : ""

  namespace_name     = var.append_random_suffix ? "${var.eventhub_namespace_name}-${local.suffix}" : var.eventhub_namespace_name
  namespace_capacity = var.sku == "Basic" ? null : var.capacity
}

resource "azurerm_eventhub_namespace" "ns" {
  name                = local.namespace_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku      = var.sku
  capacity = local.namespace_capacity

  tags = var.tags

  depends_on = [
    azapi_resource.resource_group
  ]
}

resource "azurerm_eventhub" "eh" {
  name                = var.eventhub_name
  namespace_name      = azurerm_eventhub_namespace.ns.name
  resource_group_name = var.resource_group_name

  partition_count   = var.partition_count
  message_retention = var.message_retention

  depends_on = [
    azurerm_eventhub_namespace.ns
  ]
}

resource "azurerm_eventhub_consumer_group" "cg" {
  for_each = toset(var.consumer_group_names)

  name                = each.value
  namespace_name      = azurerm_eventhub_namespace.ns.name
  eventhub_name       = azurerm_eventhub.eh.name
  resource_group_name = var.resource_group_name
}
