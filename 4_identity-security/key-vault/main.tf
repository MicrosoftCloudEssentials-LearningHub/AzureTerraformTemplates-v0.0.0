# main.tf
# This file contains the main configuration for creating Azure Key Vault.
# It defines the resource blocks for the Azure Resource Group and Key Vault.

data "azurerm_client_config" "current" {}

resource "random_id" "kv_suffix" {
  byte_length = 2
}

locals {
  effective_tenant_id = data.azurerm_client_config.current.tenant_id
  effective_key_vault_name = lower(
    var.key_vault_name_use_random_suffix
    ? "${var.key_vault_name}${random_id.kv_suffix.hex}"
    : var.key_vault_name
  )
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

resource "azurerm_key_vault" "example" {
  name                          = local.effective_key_vault_name
  location                      = azurerm_resource_group.example.location
  resource_group_name           = azurerm_resource_group.example.name
  tenant_id                     = local.effective_tenant_id
  sku_name                      = lower(var.sku_name)
  enable_rbac_authorization     = var.enable_rbac_authorization
  public_network_access_enabled = var.public_network_access_enabled

  soft_delete_retention_days = var.soft_delete_retention_days
  purge_protection_enabled   = var.purge_protection_enabled

  network_acls {
    default_action             = var.network_default_action
    bypass                     = var.network_bypass
    ip_rules                   = var.ip_rules
    virtual_network_subnet_ids = var.virtual_network_subnet_ids
  }

  tags = var.tags

  depends_on = [
    azurerm_resource_group.example
  ]
}
