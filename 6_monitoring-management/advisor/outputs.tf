output "resource_group_id" {
  description = "The resource ID of the Resource Group."
  value       = azapi_resource.resource_group.id
}

output "action_group_id" {
  description = "The resource ID of the Action Group."
  value       = azapi_resource.action_group.id
}

output "activity_log_alert_id" {
  description = "The resource ID of the Activity Log Alert."
  value       = azapi_resource.advisor_activity_log_alert.id
}
