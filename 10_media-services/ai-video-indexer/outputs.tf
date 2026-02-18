# outputs.tf

output "resource_group_id" {
  description = "The ID of the resource group."
  value       = azurerm_resource_group.rg.id
}

output "storage_account_id" {
  description = "The ID of the storage account linked to Video Indexer."
  value       = azapi_resource.storage_account.id
}

output "video_indexer_account_id" {
  description = "The resource ID of the Azure AI Video Indexer account."
  value       = jsondecode(azapi_resource.video_indexer.output).id
}

output "video_indexer_principal_id" {
  description = "The system-assigned managed identity principalId for the Video Indexer account."
  value       = jsondecode(azapi_resource.video_indexer.output).identity.principalId
}
