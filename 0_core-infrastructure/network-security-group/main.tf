# main.tf
# This file contains the main configuration for creating the Azure Network Security Group (NSG).
# It defines the resource blocks for the Azure Resource Group and Network Security Group.
# The NSG depends on the Resource Group.

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

resource "azurerm_network_security_group" "main" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name

  # Ensure the NSG depends on the Resource Group
  depends_on = [
    azurerm_resource_group.main
  ]

  tags = var.tags
}