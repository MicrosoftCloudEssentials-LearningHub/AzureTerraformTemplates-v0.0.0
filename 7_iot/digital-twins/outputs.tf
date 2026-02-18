output "resource_group_id" {
  description = "The resource ID of the Resource Group."
  value       = azapi_resource.resource_group.id
}

output "digital_twins_instance_id" {
  description = "The resource ID of the Azure Digital Twins instance."
  value       = azurerm_digital_twins_instance.dt.id
}

output "digital_twins_instance_name" {
  description = "The name of the Azure Digital Twins instance."
  value       = azurerm_digital_twins_instance.dt.name
}

output "digital_twins_host_name" {
  description = "The host name for the Azure Digital Twins instance."
  value       = azurerm_digital_twins_instance.dt.host_name
}
