# main.tf
# This file contains the main configuration for creating an Azure Traffic Manager profile.

# Resource Group
resource "azurerm_resource_group" "tm" {
  name     = var.resource_group_name
  location = var.location
}

# Traffic Manager Profile
resource "azurerm_traffic_manager_profile" "tm" {
  name                = var.traffic_manager_name
  resource_group_name = azurerm_resource_group.tm.name
  traffic_routing_method = var.traffic_routing_method

  dns_config {
    relative_name = var.dns_name
    ttl           = var.ttl
  }

  monitor_config {
    protocol = var.monitor_protocol
    port     = var.monitor_port
    path     = var.monitor_path
  }

  # Add endpoints as needed using azurerm_traffic_manager_endpoint resources
}