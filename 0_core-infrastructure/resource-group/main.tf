# main.tf
# This file contains the main configuration for creating the Azure Resource Group.
# It defines the resource block for the Azure Resource Group and uses variables for flexibility.

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}
