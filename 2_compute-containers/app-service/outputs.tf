output "app_service_name" {
  value = azurerm_linux_web_app.example.name
}

output "app_service_url" {
  value = azurerm_linux_web_app.example.default_hostname
}

output "resource_group_name" {
  value = azurerm_resource_group.example.name
}
