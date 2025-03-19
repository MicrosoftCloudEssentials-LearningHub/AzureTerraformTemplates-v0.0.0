# Main configuration file for defining PostgreSQL resources

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_postgresql_server" "example" {
  name                = var.postgresql_server_name
  location            = var.location
  resource_group_name = var.resource_group_name

  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password

  sku_name   = "B_Gen5_1"
  storage_mb = 5120
  version    = "11"

  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true
  ssl_enforcement_enabled      = var.ssl_enforcement_enabled

  # depends on the Resource Group
  depends_on = [
    azurerm_resource_group.example
  ]

}

resource "azurerm_postgresql_database" "example" {
  name                = "exampledb"
  resource_group_name = azurerm_postgresql_server.example.resource_group_name
  server_name         = azurerm_postgresql_server.example.name
  charset             = "UTF8"
  collation           = "English_United States.1252"

  # depends on the Resource Group
  depends_on = [
    azurerm_postgresql_database.example
  ]
}
