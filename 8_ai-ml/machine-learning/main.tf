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
    workspace_base      = var.workspace_name
  }
}

locals {
  suffix        = var.append_random_suffix ? random_string.suffix.result : ""
  hyphen_suffix = var.append_random_suffix ? "-${local.suffix}" : ""

  workspace_name = "${var.workspace_name}${local.hyphen_suffix}"

  storage_account_name_raw = lower("${var.storage_account_name_prefix}${local.suffix}")
  storage_account_name     = substr(join("", regexall("[a-z0-9]", local.storage_account_name_raw)), 0, 24)

  key_vault_name_raw = lower("${var.key_vault_name_prefix}${local.suffix}")
  key_vault_name     = substr(join("", regexall("[a-z0-9-]", local.key_vault_name_raw)), 0, 24)

  container_registry_name_raw = lower("${var.container_registry_name_prefix}${local.suffix}")
  container_registry_name     = substr(join("", regexall("[a-z0-9]", local.container_registry_name_raw)), 0, 50)

  application_insights_name = "${var.application_insights_name_prefix}${local.hyphen_suffix}"
}

resource "azurerm_storage_account" "sa" {
  name                     = local.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  shared_access_key_enabled       = false
  default_to_oauth_authentication = true

  tags = var.tags

  depends_on = [
    azapi_resource.resource_group
  ]

  lifecycle {
    precondition {
      condition     = length(local.storage_account_name) >= 3
      error_message = "Generated storage account name is too short. Adjust storage_account_name_prefix/random_suffix_length."
    }
  }
}

resource "azurerm_key_vault" "kv" {
  name                = local.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name

  tenant_id = data.azurerm_client_config.current.tenant_id
  sku_name  = "standard"

  soft_delete_retention_days    = 7
  purge_protection_enabled      = false
  enable_rbac_authorization     = true
  public_network_access_enabled = true

  tags = var.tags

  depends_on = [
    azapi_resource.resource_group
  ]

  lifecycle {
    precondition {
      condition     = length(local.key_vault_name) >= 3
      error_message = "Generated key vault name is too short. Adjust key_vault_name_prefix/random_suffix_length."
    }
  }
}

resource "azurerm_application_insights" "appi" {
  name                = local.application_insights_name
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = "web"

  lifecycle {
    ignore_changes = [
      workspace_id
    ]
  }

  tags = var.tags

  depends_on = [
    azapi_resource.resource_group
  ]
}

resource "azurerm_container_registry" "acr" {
  name                = local.container_registry_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Basic"
  admin_enabled       = false

  tags = var.tags

  depends_on = [
    azapi_resource.resource_group
  ]

  lifecycle {
    precondition {
      condition     = length(local.container_registry_name) >= 5
      error_message = "Generated container registry name is too short. Adjust container_registry_name_prefix/random_suffix_length."
    }
  }
}

resource "azurerm_machine_learning_workspace" "mlw" {
  name                = local.workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name

  application_insights_id = azurerm_application_insights.appi.id
  key_vault_id            = azurerm_key_vault.kv.id
  storage_account_id      = azurerm_storage_account.sa.id
  container_registry_id   = azurerm_container_registry.acr.id

  public_network_access_enabled = var.public_network_access_enabled

  dynamic "identity" {
    for_each = var.enable_system_assigned_identity ? [1] : []
    content {
      type = "SystemAssigned"
    }
  }

  tags = var.tags

  depends_on = [
    azapi_resource.resource_group
  ]
}
