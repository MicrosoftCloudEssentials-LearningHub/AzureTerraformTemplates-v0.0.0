# main.tf
# This file contains the main configuration for creating the Azure Subnet.
# It defines the resource blocks for the Azure Resource Group, Virtual Network, and Subnet.
# The Subnet depends on the Virtual Network and Resource Group.

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

  tags = var.tags
}

resource "azurerm_subnet" "main" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.subnet_address_prefixes

  # Ensure the Subnet depends on the Virtual Network and Resource Group
  depends_on = [
    azurerm_resource_group.main,
    azurerm_virtual_network.main
  ]
}