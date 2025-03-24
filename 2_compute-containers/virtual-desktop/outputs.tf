output "workspace_name" {
  value = azurerm_virtual_desktop_workspace.example.name
}

output "host_pool_name" {
  value = azurerm_virtual_desktop_host_pool.example.name
}

output "application_group_name" {
  value = azurerm_virtual_desktop_application_group.example.name
}

output "vm_names" {
  value = [for vm in azurerm_windows_virtual_machine.example : vm.name]
}

output "resource_group_name" {
  value = azurerm_resource_group.example.name
}
