# main.tf

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azapi_resource" "storage_account" {
  type      = "Microsoft.Storage/storageAccounts@2021-04-01"
  name      = var.storage_account_name
  location  = azurerm_resource_group.rg.location
  parent_id = azurerm_resource_group.rg.id

  body = jsonencode({
    kind = "StorageV2"
    sku = {
      name = "Standard_LRS"
    }
    properties = {
      minimumTlsVersion        = "TLS1_2"
      supportsHttpsTrafficOnly = true

      # Many orgs enforce disabling key-based auth at the Storage Account level.
      # Using AzAPI avoids Terraform needing to poll the data plane with account keys.
      allowSharedKeyAccess = false

      allowBlobPublicAccess = false
    }
    tags = var.tags
  })

  response_export_values = [
    "id",
    "name"
  ]
}

resource "azapi_resource" "video_indexer" {
  type      = "Microsoft.VideoIndexer/accounts@2024-01-01"
  name      = var.video_indexer_account_name
  location  = azurerm_resource_group.rg.location
  parent_id = azurerm_resource_group.rg.id

  identity {
    type = "SystemAssigned"
  }

  body = jsonencode({
    properties = {
      storageServices = {
        resourceId = azapi_resource.storage_account.id
      }
    }
    tags = var.tags
  })

  response_export_values = [
    "id",
    "name",
    "identity.principalId"
  ]
}

resource "azurerm_role_assignment" "video_indexer_storage_blob_data_contributor" {
  scope                = azapi_resource.storage_account.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = jsondecode(azapi_resource.video_indexer.output).identity.principalId

  depends_on = [
    azapi_resource.storage_account,
    azapi_resource.video_indexer
  ]
}
