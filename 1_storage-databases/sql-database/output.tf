# outputs.tf
# This file defines the outputs of the Terraform configuration.
# Outputs include the SQL Server name, SQL Database name, and associated Resource Group name.

output "sql_server_name" {
  value = azurerm_mssql_server.example.name
}

output "sql_database_name" {
  value = azurerm_mssql_database.example.name
}

output "resource_group_name" {
  value = azurerm_resource_group.example.name
}