output "resource_group_id" {
  description = "The resource ID of the Resource Group."
  value       = azapi_resource.resource_group.id
}

output "fabric_capacity_id" {
  description = "The resource ID of the Fabric capacity."
  value       = azapi_resource.fabric_capacity.id
}

output "fabric_capacity_name" {
  description = "The name of the Fabric capacity (sanitized ARM resource name)."
  value       = azapi_resource.fabric_capacity.name
}

output "fabric_capacity_name_requested" {
  description = "The requested capacity_name value after suffixing (before sanitization)."
  value       = local.capacity_name
}

output "fabric_capacity_location" {
  description = "The Azure region the Fabric capacity is deployed into."
  value       = var.location
}
