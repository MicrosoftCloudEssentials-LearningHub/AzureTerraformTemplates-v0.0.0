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
    key_vault {
      purge_soft_delete_on_destroy    = false
      recover_soft_deleted_key_vaults = true
    }
  }

  # Required when the environment/policies disable Storage Account shared-key auth.
  # This makes the AzureRM provider use Azure AD for storage data-plane operations.
  storage_use_azuread = true

  # Uses the current Azure CLI context (az login + az account set)
  skip_provider_registration = false
}

provider "azapi" {
  # Uses the current Azure CLI context (az login + az account set)
}
