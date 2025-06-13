# terraform.tfvars
# This file provides default values for the variables defined in variables.tf.
# These values can be overridden by specifying different values during Terraform execution.

# Azure Subscription
subscription_id = "" # "your-subscription-id"

# Resource Group
resource_group_name = "RG-siterecorvery-test"
location            = "eastus"

# Recovery Services Vault Configuration
vault_name         = "my-siterecovery-vault"
sku                = "Standard"
tags = {
  Environment = "SiteRecovery"
  Owner       = "IT"
}