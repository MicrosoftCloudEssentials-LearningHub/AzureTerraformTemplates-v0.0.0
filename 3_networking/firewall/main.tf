# main.tf
# This file contains the main configuration for creating an Azure Firewall and its supporting resources.

# Resource Group
resource "azurerm_resource_group" "fw" {
  name     = var.resource_group_name
  location = var.location
}

# Public IP for Firewall
resource "azurerm_public_ip" "fw" {
  name                = var.public_ip_name
  location            = azurerm_resource_group.fw.location
  resource_group_name = azurerm_resource_group.fw.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

# Virtual Network for Firewall
resource "azurerm_virtual_network" "fw" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.fw.location
  resource_group_name = azurerm_resource_group.fw.name
}

# AzureFirewallSubnet (required name and at least /26)
resource "azurerm_subnet" "fw" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.fw.name
  virtual_network_name = azurerm_virtual_network.fw.name
  address_prefixes     = var.subnet_address_prefixes
}

# Azure Firewall
resource "azurerm_firewall" "fw" {
  name                = var.firewall_name
  location            = azurerm_resource_group.fw.location
  resource_group_name = azurerm_resource_group.fw.name

  sku_tier = "Standard"
  sku_name = "AZFW_VNet"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.fw.id # Direct reference to the subnet resource
    public_ip_address_id = azurerm_public_ip.fw.id
  }
}
