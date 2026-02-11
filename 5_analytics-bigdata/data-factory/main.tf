# main.tf
# This file contains the main configuration for creating an Azure Data Factory.
# It creates a Resource Group and an Azure Data Factory with a system-assigned managed identity.

resource "azurerm_resource_group" "example" {
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
    base_name           = var.data_factory_name
  }
}

locals {
  data_factory_name_final = var.append_random_suffix ? "${var.data_factory_name}-${random_string.suffix.result}" : var.data_factory_name
}

resource "azurerm_data_factory" "example" {
  name                = local.data_factory_name_final
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  public_network_enabled = var.public_network_enabled

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags

  depends_on = [
    azurerm_resource_group.example
  ]
}
