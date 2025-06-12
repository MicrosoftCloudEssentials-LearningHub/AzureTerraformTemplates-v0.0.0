# outputs.tf
# This file defines the outputs for the Traffic Manager configuration.

output "traffic_manager_profile_id" {
  description = "The ID of the Traffic Manager profile"
  value       = azurerm_traffic_manager_profile.tm.id
}

output "traffic_manager_fqdn" {
  description = "The FQDN of the Traffic Manager profile"
  value       = azurerm_traffic_manager_profile.tm.fqdn
}