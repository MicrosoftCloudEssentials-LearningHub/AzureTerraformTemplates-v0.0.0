output "resource_group_id" {
  description = "The resource ID of the Resource Group."
  value       = azapi_resource.resource_group.id
}

output "automation_account_id" {
  description = "The resource ID of the Automation Account."
  value       = azurerm_automation_account.aa.id
}

output "automation_account_name" {
  description = "The name of the Automation Account."
  value       = azurerm_automation_account.aa.name
}

output "automation_account_identity_principal_id" {
  description = "Principal ID of the System Assigned Managed Identity (if enabled)."
  value       = try(azurerm_automation_account.aa.identity[0].principal_id, null)
}
