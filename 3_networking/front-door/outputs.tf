# outputs.tf
# This file defines the outputs for the Front Door configuration.

output "front_door_id" {
  description = "The ID of the Front Door profile"
  value       = azurerm_cdn_frontdoor_profile.fd.id
}

output "front_door_frontend_endpoint" {
  description = "The frontend endpoint hostname of the Front Door"
  value       = azurerm_cdn_frontdoor_endpoint.fd.host_name
}
