output "resource_group_id" {
  description = "The resource ID of the Resource Group."
  value       = azapi_resource.resource_group.id
}

output "cognitive_account_id" {
  description = "The resource ID of the Cognitive Services account."
  value       = azurerm_cognitive_account.cog.id
}

output "cognitive_account_name" {
  description = "The name of the Cognitive Services account."
  value       = azurerm_cognitive_account.cog.name
}

output "cognitive_account_endpoint" {
  description = "The endpoint of the Cognitive Services account."
  value       = azurerm_cognitive_account.cog.endpoint
}
