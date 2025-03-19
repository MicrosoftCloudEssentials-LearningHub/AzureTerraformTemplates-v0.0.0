resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "random_string" "name" {
  length  = 8
  special = false
}

resource "random_password" "password" {
  length  = 16
  special = true
}

resource "azurerm_mysql_flexible_server" "default" {
  location                     = azurerm_resource_group.example.location
  name                         = var.mysql_flexible_server_name
  resource_group_name          = azurerm_resource_group.example.name
  administrator_login          = random_string.name.result
  administrator_password       = random_password.password.result
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  sku_name                     = "GP_Standard_D2ds_v4"
  version                      = var.mysql_version

  high_availability {
    mode = "SameZone"
  }

  maintenance_window {
    day_of_week  = 0
    start_hour   = 8
    start_minute = 0
  }

  storage {
    iops    = 360
    size_gb = 20
  }

  # depends on the Resource Group
  depends_on = [
    azurerm_resource_group.example
  ]
}