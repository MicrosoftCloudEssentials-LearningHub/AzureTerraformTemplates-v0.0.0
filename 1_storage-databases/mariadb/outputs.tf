# File for defining output values
output "mariadb_server_name" {
  value = azapi_resource.mariadb_server.name
}

output "mariadb_database_name" {
  value = azapi_resource.mariadb_database.name
}
