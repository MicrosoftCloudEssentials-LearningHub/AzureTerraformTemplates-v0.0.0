output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.example.name
}

output "kubernetes_version" {
  value = azurerm_kubernetes_cluster.example.kubernetes_version
}

output "resource_group_name" {
  value = azurerm_resource_group.example.name
}
