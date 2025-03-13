# main.tf
# This file contains the main configuration for creating the Azure SQL Database.
# It defines the resource blocks for the Azure Resource Group, SQL Server, and SQL Database.
# The SQL Database depends on the SQL Server and Resource Group.

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

# Create an MSSQL Server
resource "azurerm_mssql_server" "example" {
  name                         = var.sql_server_name            # Name of the SQL Server
  resource_group_name          = azurerm_resource_group.example.name  # Resource group name
  location                     = azurerm_resource_group.example.location  # Location of the SQL Server
  version                      = "12.0"                         # SQL Server version
  administrator_login          = var.admin_username             # Administrator username
  administrator_login_password = var.admin_password             # Administrator password
  depends_on                   = [azurerm_resource_group.example]  # Ensure resource group is created first
}

# Add a null resource to introduce a delay
resource "null_resource" "wait_for_sql_server" {
  depends_on = [azurerm_mssql_server.example]

  provisioner "local-exec" {
    command = "Start-Sleep -Seconds 60"
    interpreter = ["PowerShell", "-Command"]
  }
}

# Create an MSSQL Database
resource "azurerm_mssql_database" "example" {
  name      = var.sql_database_name                   # Name of the SQL Database
  server_id = azurerm_mssql_server.example.id         # ID of the SQL Server
  sku_name  = "Basic"                                 # SKU name for the SQL Database
  depends_on = [null_resource.wait_for_sql_server]    # Ensure SQL Server is fully provisioned first
}