# outputs.tf
# This file defines the outputs of the Terraform configuration.
# Outputs provide information about the created resources, such as their names.

output "resource_group_name" {
  description = "The name of the created Azure Resource Group."
  value       = azurerm_resource_group.main.name
}

output "public_ip_name" {
  description = "The name of the created Azure Public IP."
  value       = azurerm_public_ip.main.name
}

output "public_ip_address" {
  description = "The IP address of the created Azure Public IP."
  value       = azurerm_public_ip.main.ip_address
}