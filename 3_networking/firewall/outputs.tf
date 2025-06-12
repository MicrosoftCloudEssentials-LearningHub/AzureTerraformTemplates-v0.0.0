# outputs.tf
# This file defines the outputs for the Azure Firewall configuration.

output "firewall_id" {
  description = "The ID of the Azure Firewall"
  value       = azurerm_firewall.fw.id
}

output "firewall_public_ip" {
  description = "The public IP address of the Azure Firewall"
  value       = azurerm_public_ip.fw.ip_address
}
