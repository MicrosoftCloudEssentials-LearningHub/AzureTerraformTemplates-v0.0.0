# Main configuration file for defining MariaDB resources
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "azapi_resource" "mariadb_server" {
  type     = "Microsoft.DBforMariaDB/servers@2018-06-01"
  name     = var.mariadb_server_name
  location = var.location

  sku = {
    capacity = var.sku_capacity
    family   = var.sku_family
    name     = var.sku_name
    size     = var.sku_size
    tier     = var.sku_tier
  }

  tags = {
    environment = "production"
  }

  body = jsonencode({
    properties = {
      minimalTlsVersion    = var.minimal_tls_version
      publicNetworkAccess  = var.public_network_access
      sslEnforcement       = var.ssl_enforcement
      storageProfile = {
        backupRetentionDays = var.backup_retention_days
        geoRedundantBackup  = var.geo_redundant_backup
        storageAutogrow     = var.storage_autogrow
        storageMB           = var.storage_mb
      }
      version    = var.mariadb_version
      createMode = "Default"
    }
  })
}

resource "azapi_resource" "mariadb_database" {
  type     = "Microsoft.DBforMariaDB/databases@2018-06-01"
  name     = "exampledb"
  location = var.location

  body = jsonencode({
    properties = {
      charset   = "UTF8"
      collation = "utf8_general_ci"
    }
  })

  depends_on = [azurerm_resource_group.example, azapi_resource.mariadb_server]
}
