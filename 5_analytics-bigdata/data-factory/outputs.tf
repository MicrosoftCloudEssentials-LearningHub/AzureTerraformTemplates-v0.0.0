# outputs.tf

output "resource_group_id" {
  description = "The ID of the resource group."
  value       = azurerm_resource_group.example.id
}

output "data_factory_id" {
  description = "The resource ID of the Azure Data Factory."
  value       = azurerm_data_factory.example.id
}

output "data_factory_name" {
  description = "The name of the Azure Data Factory."
  value       = azurerm_data_factory.example.name
}

output "data_factory_principal_id" {
  description = "The system-assigned managed identity principalId for the Data Factory."
  value       = azurerm_data_factory.example.identity[0].principal_id
}
