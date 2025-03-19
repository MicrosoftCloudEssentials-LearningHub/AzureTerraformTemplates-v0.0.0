# Main configuration file for defining MariaDB resources
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_mariadb_server" "example" {
  name                = var.mariadb_server_name
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name

  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password

  sku_name   = var.sku_name
  storage_mb = 5120
  version    = var.mariadb_version

  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled
  auto_grow_enabled            = var.auto_grow_enabled
  ssl_enforcement_enabled      = var.ssl_enforcement_enabled

    depends_on = [
    azurerm_resource_group.example
  ]
}

resource "azurerm_mariadb_database" "example" {
  name                = "exampledb"
  resource_group_name = azurerm_mariadb_server.example.resource_group_name
  server_name         = azurerm_mariadb_server.example.name
  charset             = "UTF8"
  collation           = "utf8_general_ci"

    depends_on = [
    azurerm_mariadb_server.example
  ]
}
