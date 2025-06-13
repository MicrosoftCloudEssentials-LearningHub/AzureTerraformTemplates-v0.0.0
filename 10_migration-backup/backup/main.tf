# main.tf
# This file contains the main configuration for creating an Azure Data Protection Backup Vault.

resource "azurerm_resource_group" "backup" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_data_protection_backup_vault" "backup" {
  name                = var.backup_vault_name
  resource_group_name = azurerm_resource_group.backup.name
  location            = azurerm_resource_group.backup.location
  datastore_type      = "VaultStore"
  redundancy          = var.redundancy
  tags                = var.tags
}