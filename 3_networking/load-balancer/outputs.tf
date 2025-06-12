# outputs.tf
# This file defines the outputs of the Terraform configuration.

output "resource_group_name" {
  value = azurerm_resource_group.lb.name
}

output "load_balancer_id" {
  description = "The ID of the Load Balancer"
  value       = azurerm_lb.lb.id
}

output "public_ip_address" {
  description = "The public IP address of the Load Balancer"
  value       = azurerm_public_ip.lb.ip_address
}

output "backend_pool_id" {
  description = "The ID of the Backend Address Pool"
  value       = azurerm_lb_backend_address_pool.lb.id
}

output "frontend_ip_configuration_id" {
  description = "The ID of the Frontend IP Configuration"
  value       = azurerm_lb.lb.frontend_ip_configuration[0].id
}
