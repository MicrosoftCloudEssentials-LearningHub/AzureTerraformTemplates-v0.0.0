resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_mysql_server" "example" {
  name                = var.database_server_name
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  version             = "5.7"
  administrator_login = "adminuser"
  administrator_login_password = "P@ssw0rd1234"
  sku_name            = "B_Gen5_1"
}

resource "azurerm_mysql_database" "example" {
  name                = var.mysql_database_name
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_mysql_server.example.name
  charset             = "utf8"
  collation           = "utf8_general_ci"
}

resource "azurerm_postgresql_server" "example" {
  name                = var.database_server_name
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  version             = "11"
  administrator_login = "adminuser"
  administrator_login_password = "P@ssw0rd1234"
  sku_name            = "B_Gen5_1"
}

resource "azurerm_postgresql_database" "example" {
  name                = var.postgresql_database_name
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_postgresql_server.example.name
  charset             = "UTF8"
  collation           = "en_US.UTF8"
}

resource "azurerm_mariadb_server" "example" {
  name                = var.database_server_name
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  version             = "10.3"
  administrator_login = "adminuser"
  administrator_login_password = "P@ssw0rd1234"
  sku_name            = "B_Gen5_1"
}

resource "azurerm_mariadb_database" "example" {
  name                = var.mariadb_database_name
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_mariadb_server.example.name
  charset             = "utf8"
  collation           = "utf8_general_ci"
}
