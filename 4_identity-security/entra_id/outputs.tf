output "tenant_id" {
  description = "The Microsoft Entra ID (Entra ID) tenant ID"
  value       = data.azuread_client_config.current.tenant_id
}

output "application_client_id" {
  description = "The client ID (app ID) of the application registration"
  value       = azuread_application.this.client_id
}

output "application_object_id" {
  description = "The object ID of the application registration"
  value       = azuread_application.this.object_id
}

output "service_principal_object_id" {
  description = "The object ID of the service principal (if created)"
  value       = try(azuread_service_principal.this[0].object_id, null)
}

output "client_secret" {
  description = "The generated client secret value (if created)"
  value       = try(azuread_application_password.this[0].value, null)
  sensitive   = true
}
