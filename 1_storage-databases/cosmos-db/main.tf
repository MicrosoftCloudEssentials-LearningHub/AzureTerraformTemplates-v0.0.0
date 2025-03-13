# main.tf
# This file contains the main configuration for creating the Azure Cosmos DB.
# It defines the resource blocks for the Azure Resource Group and Cosmos DB Account.
# The Cosmos DB Account depends on the Resource Group.

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

resource "azurerm_cosmosdb_account" "example" {
  name                = var.cosmosdb_account_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"
  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = azurerm_resource_group.example.location
    failover_priority = 0
  }

  tags = var.tags

  # Ensure the Cosmos DB Account depends on the Resource Group
  depends_on = [
    azurerm_resource_group.example
  ]
}