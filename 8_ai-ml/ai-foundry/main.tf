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
    resource_group_name      = var.resource_group_name
    location                 = var.location
    base_name                = var.foundry_account_name
    sku                      = var.sku_name
    allow_project_management = tostring(var.allow_project_management)
    public_network_access    = tostring(var.public_network_access_enabled)
  }
}

locals {
  suffix   = var.append_random_suffix ? random_string.suffix.result : ""
  name_raw = var.append_random_suffix ? "${var.foundry_account_name}-${local.suffix}" : var.foundry_account_name

  custom_subdomain_name_effective = (
    (var.custom_subdomain_name != null ? trimspace(var.custom_subdomain_name) : "") != ""
    ? trimspace(var.custom_subdomain_name)
    : "cog-${replace(lower(local.name_raw), "_", "-")}" # best-effort derivation
  )

  project_name_effective = (
    (var.project_name != null ? trimspace(var.project_name) : "") != ""
    ? trimspace(var.project_name)
    : substr(replace(local.name_raw, "-", ""), 0, 64)
  )

  project_display_name_effective = (
    (var.project_display_name != null ? trimspace(var.project_display_name) : "") != ""
    ? trimspace(var.project_display_name)
    : "project-${local.name_raw}"
  )

  public_network_access = var.public_network_access_enabled ? "Enabled" : "Disabled"
}

resource "azapi_resource" "foundry_account" {
  # Use the newer api-version so Foundry-specific properties (like allowProjectManagement)
  # are recognized by the resource provider. Schema validation is disabled to avoid
  # AzAPI embedded schema lagging the service.
  type                      = "Microsoft.CognitiveServices/accounts@2025-06-01"
  schema_validation_enabled = false
  name                      = local.name_raw
  location                  = var.location
  parent_id                 = azapi_resource.resource_group.id

  identity {
    type = var.enable_system_assigned_identity ? "SystemAssigned" : "None"
  }

  body = jsonencode({
    kind = "AIServices"
    properties = {
      allowProjectManagement        = var.allow_project_management
      customSubDomainName           = local.custom_subdomain_name_effective
      publicNetworkAccess           = local.public_network_access
      disableLocalAuth              = false
      dynamicThrottlingEnabled      = false
      restrictOutboundNetworkAccess = false
    }
    sku = {
      name = var.sku_name
    }
    tags = var.tags
  })

  response_export_values = ["*"]

  depends_on = [
    azapi_resource.resource_group
  ]
}

resource "azapi_resource" "foundry_project" {
  count = var.create_project ? 1 : 0

  # The projects subresource may not have schema coverage in AzAPI; disable schema validation.
  type                      = "Microsoft.CognitiveServices/accounts/projects@2025-06-01"
  schema_validation_enabled = false
  name                      = local.project_name_effective
  location                  = var.location
  parent_id                 = azapi_resource.foundry_account.id

  identity {
    type = "SystemAssigned"
  }

  body = jsonencode({
    properties = {
      displayName = local.project_display_name_effective
      description = var.project_description
    }
    tags = var.tags
  })

  response_export_values = ["*"]

  depends_on = [
    azapi_resource.foundry_account
  ]
}
