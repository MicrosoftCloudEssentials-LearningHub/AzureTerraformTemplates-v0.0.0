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

output "tsi_environment_id" {
  description = "The resource ID of the Time Series Insights environment."
  value       = azurerm_iot_time_series_insights_standard_environment.env.id
}

output "tsi_environment_name" {
  description = "The name of the Time Series Insights environment."
  value       = azurerm_iot_time_series_insights_standard_environment.env.name
}

output "tsi_event_source_id" {
  description = "The resource ID of the Time Series Insights event source."
  value       = azurerm_iot_time_series_insights_event_source_iothub.es.id
}

output "iothub_consumer_group_name" {
  description = "The name of the IoT Hub consumer group used by the event source."
  value       = azurerm_iothub_consumer_group.tsi.name
}
