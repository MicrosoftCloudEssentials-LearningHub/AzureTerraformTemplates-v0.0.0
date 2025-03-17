output "mysql_database_name" {
  value = azurerm_mysql_database.example.name
}

output "postgresql_database_name" {
  value = azurerm_postgresql_database.example.name
}

output "mariadb_database_name" {
  value = azurerm_mariadb_database.example.name
}

output "database_server_name" {
  value = azurerm_mysql_server.example.name
}

output "resource_group_name" {
  value = azurerm_resource_group.example.name
}
