# provider.tf
# This file configures the AzureRM and AzureAD (Microsoft Entra ID) providers.
# It specifies the required providers and versions, along with provider-specific configurations.

terraform {
  required_version = ">= 1.8, < 2.0"

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.0"
    }
  }
}

provider "azuread" {}
