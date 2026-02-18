output "resource_group_id" {
  description = "The resource ID of the Resource Group."
  value       = azapi_resource.resource_group.id
}

output "iothub_id" {
  description = "The resource ID of the IoT Hub."
  value       = azurerm_iothub.hub.id
}

output "iothub_name" {
  description = "The name of the IoT Hub."
  value       = azurerm_iothub.hub.name
}

output "iothub_hostname" {
  description = "The hostname of the IoT Hub."
  value       = azurerm_iothub.hub.hostname
}

output "event_hub_events_endpoint" {
  description = "The Event Hub-compatible endpoint for the built-in events endpoint."
  value       = azurerm_iothub.hub.event_hub_events_endpoint
}

output "event_hub_events_path" {
  description = "The Event Hub-compatible path for the built-in events endpoint."
  value       = azurerm_iothub.hub.event_hub_events_path
}

output "event_hub_operations_endpoint" {
  description = "The Event Hub-compatible endpoint for the built-in operations endpoint."
  value       = azurerm_iothub.hub.event_hub_operations_endpoint
}

output "event_hub_operations_path" {
  description = "The Event Hub-compatible path for the built-in operations endpoint."
  value       = azurerm_iothub.hub.event_hub_operations_path
}
