output "resource_group_id" {
  description = "The resource ID of the Resource Group."
  value       = azapi_resource.resource_group.id
}

output "machine_learning_workspace_id" {
  description = "The resource ID of the Azure Machine Learning workspace."
  value       = azurerm_machine_learning_workspace.mlw.id
}

output "machine_learning_workspace_name" {
  description = "The name of the Azure Machine Learning workspace."
  value       = azurerm_machine_learning_workspace.mlw.name
}

output "storage_account_name" {
  description = "The generated storage account name used by the workspace."
  value       = azurerm_storage_account.sa.name
}

output "key_vault_name" {
  description = "The generated key vault name used by the workspace."
  value       = azurerm_key_vault.kv.name
}

output "container_registry_name" {
  description = "The generated container registry name used by the workspace."
  value       = azurerm_container_registry.acr.name
}
