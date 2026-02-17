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

output "device_update_account_id" {
  description = "The resource ID of the Device Update for IoT Hub account."
  value       = azurerm_iothub_device_update_account.dua.id
}

output "device_update_account_name" {
  description = "The name of the Device Update for IoT Hub account."
  value       = azurerm_iothub_device_update_account.dua.name
}

output "device_update_instance_id" {
  description = "The resource ID of the Device Update instance."
  value       = azurerm_iothub_device_update_instance.instance.id
}
