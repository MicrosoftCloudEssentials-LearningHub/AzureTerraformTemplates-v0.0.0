# main.tf
# This file contains the main configuration for creating an Azure Recovery Services Vault.

# Resource Group for Site Recovery
resource "azurerm_resource_group" "site_recovery" {
  name     = var.resource_group_name
  location = var.location
}

# Azure Recovery Services Vault for Site Recovery
resource "azurerm_recovery_services_vault" "site_recovery" {
  name                = var.vault_name
  location            = azurerm_resource_group.site_recovery.location
  resource_group_name = azurerm_resource_group.site_recovery.name
  sku                 = var.sku
  tags                = var.tags
}