# outputs.tf
# This file defines the outputs of the Terraform configuration.
# Outputs include the DNS Zone name and associated Resource Group name.

output "dns_zone_name" {
  value = azurerm_dns_zone.example.name
}

output "resource_group_name" {
  value = azurerm_resource_group.example.name
}