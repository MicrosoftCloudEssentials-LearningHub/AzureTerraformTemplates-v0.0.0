# outputs.tf
# This file defines the outputs of the Terraform configuration.

output "policy_assignment_id" {
  description = "The resource ID of the Policy Assignment."
  value       = azurerm_resource_group_policy_assignment.example.id
}

output "policy_assignment_name" {
  description = "The name of the Policy Assignment."
  value       = azurerm_resource_group_policy_assignment.example.name
}

output "policy_assignment_scope" {
  description = "The scope of the Policy Assignment."
  value       = azurerm_resource_group.example.id
}

output "managed_identity_id" {
  description = "The resource ID of the User Assigned Managed Identity used by the Policy Assignment."
  value       = azurerm_user_assigned_identity.example.id
}

output "managed_identity_name" {
  description = "The name of the User Assigned Managed Identity used by the Policy Assignment."
  value       = azurerm_user_assigned_identity.example.name
}

output "managed_identity_client_id" {
  description = "The client ID (application ID) of the User Assigned Managed Identity."
  value       = azurerm_user_assigned_identity.example.client_id
}

output "managed_identity_principal_id" {
  description = "The principal ID (object ID) of the User Assigned Managed Identity."
  value       = azurerm_user_assigned_identity.example.principal_id
}

output "resource_group_name" {
  description = "The name of the Resource Group created for this template."
  value       = azurerm_resource_group.example.name
}
