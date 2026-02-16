output "resource_group_id" {
  description = "The resource ID of the Resource Group."
  value       = azapi_resource.resource_group.id
}

output "log_analytics_workspace_id" {
  description = "The resource ID of the Log Analytics workspace."
  value       = azurerm_log_analytics_workspace.law.id
}

output "log_analytics_workspace_name" {
  description = "The name of the Log Analytics workspace."
  value       = azurerm_log_analytics_workspace.law.name
}

output "log_analytics_workspace_workspace_id" {
  description = "The workspace ID (GUID) used for agent ingestion."
  value       = azurerm_log_analytics_workspace.law.workspace_id
}
