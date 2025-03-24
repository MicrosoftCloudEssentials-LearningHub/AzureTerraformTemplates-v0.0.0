output "function_app_name" {
  value = azurerm_linux_function_app.example.name
}

output "function_app_url" {
  value = azurerm_linux_function_app.example.default_hostname
}

output "resource_group_name" {
  value = azurerm_resource_group.example.name
}
