# outputs.tf
# This file defines the outputs for the Azure Migrate configuration.

output "recovery_services_vault_id" {
  description = "The ID of the Recovery Services Vault"
  value       = azurerm_recovery_services_vault.site_recovery.id
}