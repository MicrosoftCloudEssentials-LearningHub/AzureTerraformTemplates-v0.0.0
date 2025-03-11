# outputs.tf
# This file defines the outputs of the Terraform configuration.
# Outputs provide information about the created resources, such as their name and address space.

output "vnet_name" {
  description = "The name of the created Azure Virtual Network."
  value       = azurerm_virtual_network.main.name
}

output "vnet_address_space" {
  description = "The address space of the created Azure Virtual Network."
  value       = azurerm_virtual_network.main.address_space
}

output "resource_group_name" {
  description = "The name of the created Azure Resource Group."
  value       = azurerm_resource_group.main.name
}