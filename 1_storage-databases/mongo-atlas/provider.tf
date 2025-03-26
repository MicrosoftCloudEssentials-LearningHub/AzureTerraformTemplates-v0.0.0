# provider.tf
# This file configures the MongoDB Atlas and Azure providers to interact with their respective resources.

terraform {
  required_version = ">= 1.8, < 2.0"
  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "~> 1.28.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.azure_subscription_id
}
