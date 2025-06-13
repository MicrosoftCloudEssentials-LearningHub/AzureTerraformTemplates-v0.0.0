# outputs.tf
# This file defines the outputs for the Azure Data Protection Backup Vault configuration.

output "backup_vault_id" {
  description = "The ID of the Data Protection Backup Vault"
  value       = azurerm_data_protection_backup_vault.backup.id
}