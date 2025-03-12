# main.tf
# This file contains the main configuration for creating the Azure DNS Zone.
# It defines the resource blocks for the Azure Resource Group and DNS Zone.
# The DNS Zone depends on the Resource Group.

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

resource "azurerm_dns_zone" "example" {
  name                = var.dns_zone_name
  resource_group_name = azurerm_resource_group.example.name

  # Ensure the DNS Zone depends on the Resource Group
  depends_on = [
    azurerm_resource_group.example
  ]

  tags = var.tags
}