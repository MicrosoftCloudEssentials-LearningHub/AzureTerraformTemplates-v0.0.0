# main.tf
# This file contains the main configuration for creating the Azure Storage Account.
# It defines the resource blocks for the Azure Resource Group and Storage Account.
# The Storage Account depends on the Resource Group.

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = var.tags

  # Ensure the Storage Account depends on the Resource Group
  depends_on = [
    azurerm_resource_group.example
  ]
}