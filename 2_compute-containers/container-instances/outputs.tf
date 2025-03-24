output "container_group_name" {
  value = azurerm_container_group.example.name
}

output "container_ip_address" {
  value = azurerm_container_group.example.ip_address
}

output "resource_group_name" {
  value = azurerm_resource_group.example.name
}
