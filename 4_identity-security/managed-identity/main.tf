# main.tf
# This file contains the main configuration for creating an Azure User Assigned Managed Identity.
# It defines the resource blocks for the Azure Resource Group and the Managed Identity.

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

resource "azurerm_user_assigned_identity" "example" {
  name                = var.managed_identity_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  tags = var.tags

  depends_on = [
    azurerm_resource_group.example
  ]
}
