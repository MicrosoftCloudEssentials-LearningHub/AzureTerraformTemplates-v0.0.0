# main.tf
# Creates an Action Group + Activity Log Alert for new Azure Advisor recommendations.
# Based on Microsoft Learn quickstart: https://learn.microsoft.com/azure/advisor/advisor-alerts-arm

data "azurerm_client_config" "current" {}

resource "azapi_resource" "resource_group" {
  type      = "Microsoft.Resources/resourceGroups@2022-09-01"
  name      = var.resource_group_name
  location  = var.location
  parent_id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}"

  body = jsonencode({
    tags = var.tags
  })

  response_export_values = [
    "id",
    "name"
  ]
}

resource "random_string" "suffix" {
  length  = var.random_suffix_length
  upper   = false
  special = false
  numeric = true

  keepers = {
    resource_group_name = var.resource_group_name
    location            = var.location
    action_group_base   = var.action_group_name
    alert_base          = var.activity_log_alert_name
    email               = var.email_address
    category            = var.recommendation_category
    impact              = var.recommendation_impact
  }
}

locals {
  suffix = var.append_random_suffix ? random_string.suffix.result : ""

  action_group_name       = var.append_random_suffix ? "${var.action_group_name}-${local.suffix}" : var.action_group_name
  activity_log_alert_name = var.append_random_suffix ? "${var.activity_log_alert_name}-${local.suffix}" : var.activity_log_alert_name

  subscription_scope = "/subscriptions/${data.azurerm_client_config.current.subscription_id}"
  alert_scope = (
    var.scope_resource_group_name == null
    ? local.subscription_scope
    : "${local.subscription_scope}/resourceGroups/${var.scope_resource_group_name}"
  )
}

resource "azapi_resource" "action_group" {
  type      = "Microsoft.Insights/actionGroups@2019-06-01"
  name      = local.action_group_name
  location  = "Global"
  parent_id = azapi_resource.resource_group.id

  body = jsonencode({
    properties = {
      groupShortName = var.action_group_short_name
      enabled        = true
      emailReceivers = [
        {
          name         = "email"
          emailAddress = var.email_address
        }
      ]
      smsReceivers     = []
      webhookReceivers = []
    }
    tags = var.tags
  })

  response_export_values = [
    "id",
    "name"
  ]

  depends_on = [
    azapi_resource.resource_group
  ]
}

resource "azapi_resource" "advisor_activity_log_alert" {
  type      = "Microsoft.Insights/activityLogAlerts@2017-04-01"
  name      = local.activity_log_alert_name
  location  = "Global"
  parent_id = azapi_resource.resource_group.id

  body = jsonencode({
    properties = {
      scopes = [
        local.alert_scope
      ]
      condition = {
        allOf = [
          {
            field  = "category"
            equals = "Recommendation"
          },
          {
            field  = "properties.recommendationCategory"
            equals = var.recommendation_category
          },
          {
            field  = "properties.recommendationImpact"
            equals = var.recommendation_impact
          },
          {
            field  = "operationName"
            equals = "Microsoft.Advisor/recommendations/available/action"
          }
        ]
      }
      actions = {
        actionGroups = [
          {
            actionGroupId     = azapi_resource.action_group.id
            webhookProperties = {}
          }
        ]
      }
      enabled     = var.enabled
      description = var.description
    }
    tags = var.tags
  })

  response_export_values = [
    "id",
    "name"
  ]

  depends_on = [
    azapi_resource.action_group
  ]
}
