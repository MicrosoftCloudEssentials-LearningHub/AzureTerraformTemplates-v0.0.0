data "azurerm_client_config" "current" {}

data "azuread_client_config" "current" {}

data "azuread_user" "current" {
  object_id = data.azuread_client_config.current.object_id
}

# Resource group creation is idempotent in ARM (PUT). This will create the RG if it doesn't exist,
# or update tags if it already exists.
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
    capacity_base       = var.capacity_name
    sku_name            = var.sku_name
    sku_tier            = var.sku_tier
  }
}

locals {
  rg_id         = azapi_resource.resource_group.id
  suffix        = var.append_random_suffix ? random_string.suffix.result : ""
  capacity_name = var.append_random_suffix ? "${var.capacity_name}-${local.suffix}" : var.capacity_name

  # AzAPI schema validation for Microsoft.Fabric/capacities currently enforces a strict name pattern:
  # ^[a-z][a-z0-9]*$
  # To keep tfvars friendly (allowing '-' etc.), we sanitize the requested name for the ARM resource name.
  capacity_name_sanitized_raw = join("", regexall("[a-z0-9]", lower(local.capacity_name)))
  capacity_name_sanitized     = can(regex("^[a-z]", local.capacity_name_sanitized_raw)) ? local.capacity_name_sanitized_raw : "fc${local.capacity_name_sanitized_raw}"

  admin_members_effective = (
    length(var.admin_members) > 0
    ? var.admin_members
    : (var.use_current_user_as_admin ? [data.azuread_user.current.user_principal_name] : [])
  )
}

# Microsoft Fabric capacity (ARM resource provider: Microsoft.Fabric)
# API version reference: https://learn.microsoft.com/azure/templates/Microsoft.Fabric/2023-11-01/capacities
resource "azapi_resource" "fabric_capacity" {
  type      = "Microsoft.Fabric/capacities@2023-11-01"
  name      = local.capacity_name_sanitized
  location  = var.location
  parent_id = local.rg_id

  lifecycle {
    precondition {
      condition     = length(local.admin_members_effective) > 0
      error_message = "No Fabric admins configured. Set admin_members (list of UPNs) or enable use_current_user_as_admin to auto-resolve the current user."
    }
  }

  body = jsonencode({
    sku = {
      name = var.sku_name
      tier = var.sku_tier
    }
    properties = {
      administration = {
        members = local.admin_members_effective
      }
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
