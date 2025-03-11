# outputs.tf
# This file defines the outputs of the Terraform configuration.
# Outputs provide information about the created resources, such as their name and location.

output "resource_group_name" {
  description = "The name of the created Azure Resource Group."
  value       = azurerm_resource_group.main.name
}

output "resource_group_location" {
  description = "The location of the created Azure Resource Group."
  value       = azurerm_resource_group.main.location
}
