# outputs.tf

output "resource_group_id" {
  description = "The ID of the resource group."
  value       = azapi_resource.resource_group.id
}

output "databricks_workspace_id" {
  description = "The resource ID of the Databricks workspace."
  value       = azurerm_databricks_workspace.ws.id
}

output "databricks_workspace_name" {
  description = "The name of the Databricks workspace."
  value       = azurerm_databricks_workspace.ws.name
}

output "databricks_workspace_url" {
  description = "The workspace URL of the Databricks workspace."
  value       = azurerm_databricks_workspace.ws.workspace_url
}
