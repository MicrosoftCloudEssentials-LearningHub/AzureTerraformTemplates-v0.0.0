# File for defining output values

output "postgresql_server_name" {
  value = azurerm_postgresql_server.example.name
}

output "postgresql_database_name" {
  value = azurerm_postgresql_database.example.name
}
