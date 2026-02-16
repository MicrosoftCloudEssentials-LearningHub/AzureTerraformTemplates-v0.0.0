output "resource_group_id" {
  description = "The resource ID of the Resource Group."
  value       = azapi_resource.resource_group.id
}

output "eventhub_namespace_id" {
  description = "The resource ID of the Event Hubs namespace."
  value       = azurerm_eventhub_namespace.ns.id
}

output "eventhub_namespace_name" {
  description = "The name of the Event Hubs namespace."
  value       = azurerm_eventhub_namespace.ns.name
}

output "eventhub_id" {
  description = "The resource ID of the Event Hub."
  value       = azurerm_eventhub.eh.id
}

output "eventhub_name" {
  description = "The name of the Event Hub."
  value       = azurerm_eventhub.eh.name
}

output "consumer_group_ids" {
  description = "Map of consumer group names to IDs."
  value       = { for k, v in azurerm_eventhub_consumer_group.cg : k => v.id }
}
