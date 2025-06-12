# outputs.tf
# This file defines the outputs of the Terraform configuration.

output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.agw.name
}

output "application_gateway_id" {
  description = "The ID of the Application Gateway"
  value       = azurerm_application_gateway.agw.id
}

output "application_gateway_frontend_ip" {
  description = "The frontend public IP address of the Application Gateway"
  value       = azurerm_public_ip.agw.ip_address
}

output "virtual_network_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.vnet.name
}

output "subnet_name" {
  description = "The name of the subnet used by the Application Gateway"
  value       = azurerm_subnet.subnet.name
}
