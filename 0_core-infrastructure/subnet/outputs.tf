# outputs.tf
# This file defines the outputs of the Terraform configuration.
# Outputs provide information about the created resources, such as their names and address prefixes.

output "resource_group_name" {
  description = "The name of the created Azure Resource Group."
  value       = azurerm_resource_group.main.name
}

output "vnet_name" {
  description = "The name of the created Azure Virtual Network."
  value       = azurerm_virtual_network.main.name
}

output "subnet_name" {
  description = "The name of the created Azure Subnet."
  value       = azurerm_subnet.main.name
}

output "subnet_address_prefixes" {
  description = "The address prefixes of the created Azure Subnet."
  value       = azurerm_subnet.main.address_prefixes
}