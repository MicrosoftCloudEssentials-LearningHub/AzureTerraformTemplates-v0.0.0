# main.tf
# This file contains the main configuration for creating the Azure Public IP.
# It defines the resource blocks for the Azure Resource Group and Public IP.
# The Public IP depends on the Resource Group.

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

resource "azurerm_public_ip" "main" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = var.allocation_method
  sku                 = var.sku

  # Ensure the Public IP depends on the Resource Group
  depends_on = [
    azurerm_resource_group.main
  ]

  tags = var.tags
}