# outputs.tf
# This file defines the outputs of the Terraform configuration.
# Outputs provide information about the created resources, such as their names.

output "resource_group_name" {
  description = "The name of the created Azure Resource Group."
  value       = azurerm_resource_group.main.name
}

output "nsg_name" {
  description = "The name of the created Azure Network Security Group."
  value       = azurerm_network_security_group.main.name
}