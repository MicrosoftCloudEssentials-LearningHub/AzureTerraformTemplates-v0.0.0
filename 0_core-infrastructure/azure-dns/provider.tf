# provider.tf
# This file configures the Azure provider to interact with Azure resources.
# It includes the subscription ID and enables necessary features.

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}