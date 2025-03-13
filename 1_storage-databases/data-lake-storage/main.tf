# main.tf
# This file contains the main configuration for creating the Azure Data Lake Storage Gen2.
# It defines the resource blocks for the Azure Resource Group, Storage Account, and Data Lake Gen2 File System.
# The Data Lake Gen2 File System depends on the Storage Account and Resource Group.

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = true

  tags = var.tags

  # Ensure the Storage Account depends on the Resource Group
  depends_on = [
    azurerm_resource_group.example
  ]
}

resource "azurerm_storage_data_lake_gen2_filesystem" "example" {
  name                = var.filesystem_name
  storage_account_id  = azurerm_storage_account.example.id

  # Ensure the Data Lake Gen2 File System depends on the Storage Account
  depends_on = [
    azurerm_storage_account.example
  ]

  properties = {
    hello = "aGVsbG8="
  }
}