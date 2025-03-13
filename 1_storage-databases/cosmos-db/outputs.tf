# outputs.tf
# This file defines the outputs of the Terraform configuration.
# Outputs include the Cosmos DB Account name and associated Resource Group name.

output "cosmosdb_account_name" {
  value = azurerm_cosmosdb_account.example.name
}

output "resource_group_name" {
  value = azurerm_resource_group.example.name
}