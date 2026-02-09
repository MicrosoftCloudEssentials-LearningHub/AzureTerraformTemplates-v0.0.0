# outputs.tf
# This file defines the outputs of the Terraform configuration.

output "key_vault_id" {
  description = "The resource ID of the Key Vault."
  value       = azurerm_key_vault.example.id
}

output "key_vault_name" {
  description = "The name of the Key Vault."
  value       = azurerm_key_vault.example.name
}

output "key_vault_uri" {
  description = "The DNS name (vault URI) of the Key Vault."
  value       = azurerm_key_vault.example.vault_uri
}

output "resource_group_name" {
  description = "The name of the Resource Group created for this template."
  value       = azurerm_resource_group.example.name
}

output "tenant_id" {
  description = "The tenant ID used for the Key Vault."
  value       = local.effective_tenant_id
}
