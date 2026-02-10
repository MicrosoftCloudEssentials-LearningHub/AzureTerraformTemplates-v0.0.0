# main.tf
# This file contains the main configuration for creating an Azure Policy Assignment.
# It creates a Resource Group, a User Assigned Managed Identity, and a Policy Assignment scoped to the Resource Group.

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

resource "azurerm_user_assigned_identity" "example" {
  name                = var.managed_identity_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  tags = var.tags

  depends_on = [
    azurerm_resource_group.example
  ]
}

resource "azurerm_resource_group_policy_assignment" "example" {
  name                 = var.policy_assignment_name
  resource_group_id    = azurerm_resource_group.example.id
  policy_definition_id = var.policy_definition_id

  location     = azurerm_resource_group.example.location
  display_name = var.policy_assignment_display_name
  description  = var.policy_assignment_description
  parameters   = var.policy_parameters_json

  enforce = var.enforce

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.example.id]
  }

  depends_on = [
    azurerm_user_assigned_identity.example
  ]
}
