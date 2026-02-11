# outputs.tf

output "resource_group_id" {
  description = "The ID of the resource group."
  value       = azurerm_resource_group.rg.id
}

output "storage_account_id" {
  description = "The resource ID of the Storage Account backing Synapse."
  value       = azapi_resource.storage_account.id
}

output "filesystem_id" {
  description = "The ARM resource ID of the ADLS Gen2 filesystem (container)."
  value       = azapi_resource.filesystem.id
}

output "filesystem_dfs_url" {
  description = "The DFS URL format used by Synapse for the default data lake storage filesystem."
  value       = "https://${azapi_resource.storage_account.name}.dfs.core.windows.net/${azapi_resource.filesystem.name}"
}

output "synapse_workspace_id" {
  description = "The resource ID of the Synapse workspace."
  value       = azurerm_synapse_workspace.ws.id
}

output "synapse_workspace_name" {
  description = "The name of the Synapse workspace."
  value       = azurerm_synapse_workspace.ws.name
}
