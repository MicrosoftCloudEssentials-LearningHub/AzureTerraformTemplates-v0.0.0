# terraform.tfvars
# This file provides default values for the variables defined in variables.tf.
# These values can be overridden by specifying different values during Terraform execution.

# Azure Subscription
subscription_id = "" # "your-subscription-id"

# Resource Group
resource_group_name = "RG-backupvault-test"
location            = "eastus"

# Backup Vault
backup_vault_name  = "my-backup-vault"
redundancy         = "LocallyRedundant"
tags = {
  Environment = "Backup"
  Owner       = "IT"
}