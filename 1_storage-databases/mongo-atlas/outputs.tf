output "resource_group_name" {
  description = "The name of the resource group created in Azure."
  value       = azurerm_resource_group.example.name
}

output "vnet_name" {
  description = "The name of the virtual network created in Azure."
  value       = azurerm_virtual_network.example.name
}

output "mongodbatlas_project_id" {
  description = "The ID of the MongoDB Atlas project."
  value       = mongodbatlas_project.example.id
}

output "mongodbatlas_network_container_id" {
  description = "The ID of the MongoDB Atlas network container."
  value       = mongodbatlas_network_container.example.id
}

output "mongodbatlas_network_peering_id" {
  description = "The ID of the MongoDB Atlas network peering."
  value       = mongodbatlas_network_peering.azure_mongodb.id
}

output "mongodbatlas_cluster_id" {
  description = "The ID of the MongoDB Atlas cluster."
  value       = mongodbatlas_advanced_cluster.test.id
}
