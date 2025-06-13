# outputs.tf
# This file defines the outputs for the Azure CDN configuration.

output "cdn_profile_id" {
  description = "The ID of the CDN profile"
  value       = azurerm_cdn_profile.cdn.id
}

output "cdn_endpoint_id" {
  description = "The ID of the CDN endpoint"
  value       = azurerm_cdn_endpoint.cdn.id
}
