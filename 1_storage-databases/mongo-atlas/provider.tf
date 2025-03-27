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
    time = {
      source  = "hashicorp/time"
      version = "0.7.2"
    }
  }
}

provider "mongodbatlas" {
  public_key  = var.mongodbatlas_public_key
  private_key = var.mongodbatlas_private_key
}

provider "azurerm" {
  features {}
  subscription_id = var.azure_subscription_id
}

provider "time" {}
