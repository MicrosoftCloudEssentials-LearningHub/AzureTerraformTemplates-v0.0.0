# main.tf
# This file contains the main configuration for creating an Azure ExpressRoute circuit.

# Resource Group
resource "azurerm_resource_group" "er" {
  name     = var.resource_group_name
  location = var.location
}

# ExpressRoute Circuit
resource "azurerm_express_route_circuit" "er" {
  name                  = var.expressroute_name
  location              = azurerm_resource_group.er.location
  resource_group_name   = azurerm_resource_group.er.name
  service_provider_name = var.service_provider_name
  peering_location      = var.peering_location
  bandwidth_in_mbps     = var.bandwidth_in_mbps

  sku {
    tier   = var.sku_tier
    family = var.sku_family
  }
}