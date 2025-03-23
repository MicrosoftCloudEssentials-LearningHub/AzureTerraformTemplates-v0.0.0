output "vm_name" {
  value = azurerm_virtual_machine.example.name
}

output "vm_ip_address" {
  value = azurerm_network_interface.example.private_ip_address
}

output "resource_group_name" {
  value = azurerm_resource_group.example.name
}
