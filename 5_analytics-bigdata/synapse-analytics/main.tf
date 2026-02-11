# main.tf
# Creates an Azure Synapse Analytics workspace backed by an ADLS Gen2 filesystem.
# Storage resources are created via AzAPI (management plane) to avoid key-based data-plane operations.

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

resource "random_string" "suffix" {
  length  = var.random_suffix_length
  upper   = false
  special = false
  numeric = true

  keepers = {
    resource_group_name = var.resource_group_name
    location            = var.location
    workspace_base      = var.synapse_workspace_name
    storage_base        = var.storage_account_name
    managed_rg_base     = var.managed_resource_group_name
  }
}

locals {
  suffix                 = var.append_random_suffix ? random_string.suffix.result : ""
  synapse_workspace_name = var.append_random_suffix ? "${var.synapse_workspace_name}-${local.suffix}" : var.synapse_workspace_name
  managed_rg_name        = var.append_random_suffix ? "${var.managed_resource_group_name}-${local.suffix}" : var.managed_resource_group_name

  # Storage Account names must be lowercase alphanumeric and cannot contain dashes.
  storage_account_name = var.append_random_suffix ? "${var.storage_account_name}${local.suffix}" : var.storage_account_name

  # azurerm_synapse_workspace expects the Data Lake Gen2 filesystem id in DFS URL form.
  # Format: https://<accountname>.dfs.core.windows.net/<filesystem>
  dfs_filesystem_id = "https://${local.storage_account_name}.dfs.core.windows.net/${var.filesystem_name}"
}

resource "azapi_resource" "storage_account" {
  type      = "Microsoft.Storage/storageAccounts@2021-04-01"
  name      = local.storage_account_name
  location  = azurerm_resource_group.rg.location
  parent_id = azurerm_resource_group.rg.id

  body = jsonencode({
    kind = "StorageV2"
    sku = {
      name = "Standard_LRS"
    }
    properties = {
      isHnsEnabled             = true
      minimumTlsVersion        = "TLS1_2"
      supportsHttpsTrafficOnly = true

      # Often enforced by org policy; also avoids Terraform needing to use shared keys.
      allowSharedKeyAccess  = false
      allowBlobPublicAccess = false
    }
    tags = var.tags
  })

  response_export_values = [
    "id",
    "name"
  ]
}

resource "azapi_resource" "filesystem" {
  type = "Microsoft.Storage/storageAccounts/blobServices/containers@2022-09-01"
  name = var.filesystem_name

  parent_id = "${azapi_resource.storage_account.id}/blobServices/default"

  body = jsonencode({
    properties = {
      publicAccess = "None"
    }
  })

  response_export_values = [
    "id",
    "name"
  ]

  depends_on = [
    azapi_resource.storage_account
  ]
}

resource "azurerm_synapse_workspace" "ws" {
  name                                 = local.synapse_workspace_name
  resource_group_name                  = azurerm_resource_group.rg.name
  location                             = azurerm_resource_group.rg.location
  managed_resource_group_name          = local.managed_rg_name
  storage_data_lake_gen2_filesystem_id = local.dfs_filesystem_id

  sql_administrator_login          = var.sql_administrator_login
  sql_administrator_login_password = var.sql_administrator_password

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags

  depends_on = [
    azapi_resource.filesystem
  ]
}
