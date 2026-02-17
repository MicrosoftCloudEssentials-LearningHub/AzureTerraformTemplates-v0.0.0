output "resource_group_id" {
  description = "The resource ID of the Resource Group."
  value       = azapi_resource.resource_group.id
}

output "search_service_id" {
  description = "The resource ID of the Azure AI Search service."
  value       = azurerm_search_service.search.id
}

output "search_service_name" {
  description = "The name of the Azure AI Search service."
  value       = azurerm_search_service.search.name
}

output "search_service_endpoint" {
  description = "The endpoint of the Azure AI Search service."
  value       = "https://${azurerm_search_service.search.name}.search.windows.net"
}
