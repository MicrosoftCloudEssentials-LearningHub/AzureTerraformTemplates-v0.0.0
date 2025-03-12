# outputs.tf
# This file defines the outputs of the Terraform configuration.
# Outputs include the Storage Account name, File Share name, and associated Resource Group name.

output "storage_account_name" {
  value = azurerm_storage_account.example.name
}

output "share_name" {
  value = azurerm_storage_share.example.name
}

output "resource_group_name" {
  value = azurerm_resource_group.example.name
}