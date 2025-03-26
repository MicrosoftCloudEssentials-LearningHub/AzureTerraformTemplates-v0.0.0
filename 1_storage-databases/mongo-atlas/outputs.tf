output "network_peering_id" {
  value = mongodbatlas_network_peering.azure_mongodb.id
}

output "resource_group_name" {
  value = azurerm_resource_group.example.name
}

output "vnet_name" {
  value = azurerm_virtual_network.example.name
}

output "mongodbatlas_project_id" {
  value = mongodbatlas_project.example.id
}
