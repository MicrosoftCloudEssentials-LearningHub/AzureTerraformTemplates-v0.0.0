# outputs.tf
# This file defines the outputs for the VPN Gateway configuration.

output "vpn_gateway_id" {
  description = "The ID of the VPN Gateway"
  value       = azurerm_virtual_network_gateway.vpngw.id
}

output "vpn_gateway_public_ip" {
  description = "The public IP address of the VPN Gateway"
  value       = azurerm_public_ip.vpngw.ip_address
}
