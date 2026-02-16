# main.tf
# This file contains the main configuration for creating the Azure Bastion host.
# It defines the resource blocks for the Azure Resource Group, Virtual Network, Subnet, Public IP, and Bastion Host.
# The Bastion Host depends on the Resource Group, Virtual Network, and Subnet.

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

resource "azurerm_virtual_network" "example" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  tags = var.tags
}

resource "azurerm_subnet" "example" {
  name                 = "AzureBastionSubnet" # Required name for the Bastion subnet
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = var.subnet_address_prefixes
}

resource "azurerm_public_ip" "example" {
  name                = var.public_ip_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = var.tags
}

resource "azurerm_bastion_host" "example" {
  name                = var.bastion_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "Standard"
  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.example.id
    public_ip_address_id = azurerm_public_ip.example.id
  }

  # Ensure the Bastion Host depends on the Resource Group, Virtual Network, and Subnet
  depends_on = [
    azurerm_resource_group.example,
    azurerm_virtual_network.example,
    azurerm_subnet.example
  ]

  tags = var.tags
}
