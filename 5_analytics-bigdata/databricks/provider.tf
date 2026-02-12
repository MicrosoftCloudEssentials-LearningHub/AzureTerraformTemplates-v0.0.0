# provider.tf
# Provider configuration for Azure Databricks workspace deployment.

terraform {
  required_version = ">= 1.8, < 2.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.116"
    }

    azapi = {
      source  = "Azure/azapi"
      version = "~> 1.13"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }

  # Uses the current Azure CLI context (az login + az account set)
  skip_provider_registration = false
}

provider "azapi" {
  # Uses the current Azure CLI context (az login + az account set)
}
