# outputs.tf
# This file defines the outputs of the Terraform configuration.
# Outputs include the Bastion Host name and associated Resource Group name.

output "bastion_name" {
  value = azurerm_bastion_host.example.name
}

output "resource_group_name" {
  value = azurerm_resource_group.example.name
}