# main.tf
# This file contains the main configuration for creating the Azure SQL Database.
# It defines the resource blocks for the Azure Resource Group, SQL Server, and SQL Database.
# The SQL Database depends on the SQL Server and Resource Group.

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

resource "azurerm_mssql_server" "example" {
  name                         = var.sql_server_name
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password

  tags = var.tags

  # Ensure the SQL Server depends on the Resource Group
  depends_on = [
    azurerm_resource_group.example
  ]
}

resource "azurerm_mssql_database" "example" {
  name                = var.sql_database_name
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_mssql_server.example.name
  sku_name            = var.sku_name

  tags = var.tags

  # Ensure the SQL Database depends on the SQL Server
  depends_on = [
    azurerm_mssql_server.example
  ]
}