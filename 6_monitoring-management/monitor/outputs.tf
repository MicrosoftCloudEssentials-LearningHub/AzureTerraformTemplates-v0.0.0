output "resource_group_id" {
  description = "The resource ID of the Resource Group."
  value       = azapi_resource.resource_group.id
}

output "action_group_id" {
  description = "The resource ID of the Action Group."
  value       = azurerm_monitor_action_group.ag.id
}

output "action_group_name" {
  description = "The name of the Action Group."
  value       = azurerm_monitor_action_group.ag.name
}
