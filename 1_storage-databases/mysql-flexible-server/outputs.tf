output "resource_group_name" {
  value = azurerm_resource_group.example.name
}

output "mysql_server_name" {
  value = azurerm_mysql_flexible_server.default.name
}

output "mysql_server_admin_login" {
  value = azurerm_mysql_flexible_server.default.administrator_login
}
