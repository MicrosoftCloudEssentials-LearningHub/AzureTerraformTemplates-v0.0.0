output "resource_group_id" {
  description = "The resource ID of the Resource Group."
  value       = azapi_resource.resource_group.id
}

output "foundry_account_id" {
  description = "The resource ID of the Foundry account (Cognitive Services account kind AIServices)."
  value       = azapi_resource.foundry_account.id
}

output "foundry_account_name" {
  description = "The name of the Foundry account."
  value       = azapi_resource.foundry_account.name
}

output "foundry_account_endpoint" {
  description = "The endpoint of the Foundry account (when available in the resource properties)."
  value       = try(jsondecode(azapi_resource.foundry_account.output).properties.endpoint, null)
}

output "foundry_project_id" {
  description = "The resource ID of the Foundry project (if created)."
  value       = try(azapi_resource.foundry_project[0].id, null)
}

output "foundry_project_name" {
  description = "The name of the Foundry project (if created)."
  value       = try(azapi_resource.foundry_project[0].name, null)
}
