# main.tf
# This file contains the main configuration for creating the Azure Virtual Network.
# It defines the resource blocks for the Azure Resource Group and Virtual Network.
# The Virtual Network depends on the Resource Group.

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

resource "azurerm_virtual_network" "main" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = var.address_space

  # Ensure the Virtual Network depends on the Resource Group
  depends_on = [
    azurerm_resource_group.main
  ]

  tags = var.tags
}