# terraform.tfvars
# High level: this module creates an Entra ID app registration and (optionally) a service principal, client secret, and Azure RBAC role assignment.
# This file provides example values for the variables defined in variables.tf.
# Tip: IDs come from your current Azure CLI session (PowerShell):
#   $env:ARM_SUBSCRIPTION_ID = (az account show --query id -o tsv)
#   $env:ARM_TENANT_ID       = (az account show --query tenantId -o tsv)

# Required
app_display_name = "eg-brown-entra-app"

# Optional (opt-in)
# Create a service principal for the app registration
create_service_principal = false

# Create a client secret (only applies if you manage secrets via Terraform)
create_client_secret = false

# Optional: set owners explicitly (object IDs). If empty, current principal becomes owner.
# application_owners = ["00000000-0000-0000-0000-000000000000"]

# If create_client_secret = true
# client_secret_display_name      = "terraform-client-secret"
# client_secret_end_date_relative = "4320h"

# Optional: assign RBAC role to the service principal
# Azure RBAC is not part of this Entra-only template.
