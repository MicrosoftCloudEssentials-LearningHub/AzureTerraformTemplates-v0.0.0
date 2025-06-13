# main.tf
# This file contains the main configuration for creating an Azure VPN Gateway and its supporting resources.

# Resource Group
resource "azurerm_resource_group" "vpngw" {
  name     = var.resource_group_name
  location = var.location
}

# Virtual Network for VPN Gateway
resource "azurerm_virtual_network" "vpngw" {
  name                = "vpngw-vnet"
  address_space       = ["10.10.0.0/16"]
  location            = azurerm_resource_group.vpngw.location
  resource_group_name = azurerm_resource_group.vpngw.name
}

# GatewaySubnet (required name and at least /27)
resource "azurerm_subnet" "gateway" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.vpngw.name
  virtual_network_name = azurerm_virtual_network.vpngw.name
  address_prefixes     = ["10.10.1.0/27"]
}

# Public IP for VPN Gateway
resource "azurerm_public_ip" "vpngw" {
  name                = var.public_ip_name
  location            = azurerm_resource_group.vpngw.location
  resource_group_name = azurerm_resource_group.vpngw.name
  allocation_method   = "Static" # <-- Must be Static for Standard SKU
  sku                 = "Standard"
}

# VPN Gateway
resource "azurerm_virtual_network_gateway" "vpngw" {
  name                = var.vpn_gateway_name
  location            = azurerm_resource_group.vpngw.location
  resource_group_name = azurerm_resource_group.vpngw.name
  type                = "Vpn"
  vpn_type            = "RouteBased"
  active_active       = false
  enable_bgp          = false
  sku                 = var.vpn_gateway_sku

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.vpngw.id
    subnet_id                     = azurerm_subnet.gateway.id
    private_ip_address_allocation = "Dynamic"
  }
}