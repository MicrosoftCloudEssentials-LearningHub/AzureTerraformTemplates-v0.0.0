# File for defining output values
output "mariadb_server_name" {
  value = azurerm_mariadb_server.example.name
}

output "mariadb_database_name" {
  value = azurerm_mariadb_database.example.name
}
