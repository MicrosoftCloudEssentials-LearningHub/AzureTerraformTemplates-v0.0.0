# provider.tf
# This file configures the Azure provider to interact with Azure resources.
# It specifies the required provider and its version, along with provider-specific configurations.

terraform {
  required_version = ">= 1.8, < 2.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.116"
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
