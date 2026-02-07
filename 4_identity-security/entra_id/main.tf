# main.tf
# High level: creates a Microsoft Entra ID application registration (tenant-level).
# Optionally creates a service principal and a client secret.
# Azure RBAC assignment is intentionally not included in this template (it requires the AzureRM provider and an Azure subscription context).

data "azuread_client_config" "current" {}

locals {
  effective_owners = length(var.application_owners) > 0 ? var.application_owners : toset([data.azuread_client_config.current.object_id])
}

resource "azuread_application" "this" {
  display_name     = var.app_display_name
  owners           = local.effective_owners
  sign_in_audience = var.sign_in_audience
}

resource "azuread_service_principal" "this" {
  count                        = var.create_service_principal ? 1 : 0
  client_id                    = azuread_application.this.client_id
  owners                       = local.effective_owners
  use_existing                 = var.use_existing_service_principal
  app_role_assignment_required = false
}

resource "azuread_application_password" "this" {
  count            = var.create_client_secret ? 1 : 0
  application_id   = azuread_application.this.id
  display_name     = var.client_secret_display_name
  end_date         = timeadd(timestamp(), var.client_secret_end_date_relative)
}
