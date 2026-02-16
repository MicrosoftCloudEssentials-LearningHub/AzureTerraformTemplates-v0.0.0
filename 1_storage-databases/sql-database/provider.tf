terraform {
  required_version = ">= 1.8, < 2.0"
  # Specify the required providers and their versions
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm" # Source of the AzureRM provider
      version = "~> 4.16.0"         # Version of the AzureRM provider
    }
  }
}

provider "azurerm" {
  features {}                           # Enable all features for the AzureRM provider
  subscription_id = var.subscription_id # Add your subscription ID here
}