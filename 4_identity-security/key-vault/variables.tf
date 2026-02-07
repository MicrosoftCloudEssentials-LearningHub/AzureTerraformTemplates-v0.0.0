# variables.tf
# This file defines the input variables used in the Terraform configuration.

variable "resource_group_name" {
  description = "The name of the Azure Resource Group to associate the Key Vault with."
  type        = string
}

variable "location" {
  description = "The Azure region where the Resource Group will be created."
  type        = string
}

variable "key_vault_name" {
  description = "The base name of the Azure Key Vault to create (3-24 characters, alphanumeric only)."
  type        = string

  validation {
    condition     = can(regex("^[0-9A-Za-z]{3,24}$", var.key_vault_name))
    error_message = "key_vault_name must be 3-24 characters and alphanumeric only (A-Z, a-z, 0-9)."
  }
}

variable "key_vault_name_use_random_suffix" {
  description = "When true, appends a short random suffix to the Key Vault name to avoid global name collisions."
  type        = bool
  default     = true
}

variable "sku_name" {
  description = "The SKU name for Key Vault. Valid values: standard, premium."
  type        = string
  default     = "standard"

  validation {
    condition     = contains(["standard", "premium"], lower(var.sku_name))
    error_message = "sku_name must be either 'standard' or 'premium'."
  }
}

variable "enable_rbac_authorization" {
  description = "When true, Key Vault data-plane access is controlled via Azure RBAC instead of access policies."
  type        = bool
  default     = true
}

variable "public_network_access_enabled" {
  description = "When true, allows public network access to the Key Vault (subject to firewall rules)."
  type        = bool
  default     = true
}

variable "soft_delete_retention_days" {
  description = "Number of days to retain soft-deleted vaults, keys, secrets, and certificates."
  type        = number
  default     = 90

  validation {
    condition     = var.soft_delete_retention_days >= 7 && var.soft_delete_retention_days <= 90
    error_message = "soft_delete_retention_days must be between 7 and 90."
  }
}

variable "purge_protection_enabled" {
  description = "Enable purge protection (recommended for production; can affect destroy workflows)."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}

variable "network_default_action" {
  description = "Default action for Key Vault network ACLs. Valid values: Allow, Deny."
  type        = string
  default     = "Allow"

  validation {
    condition     = contains(["Allow", "Deny"], var.network_default_action)
    error_message = "network_default_action must be either 'Allow' or 'Deny'."
  }
}

variable "network_bypass" {
  description = "Specifies which traffic can bypass the firewall. Valid values: AzureServices, None."
  type        = string
  default     = "AzureServices"

  validation {
    condition     = contains(["AzureServices", "None"], var.network_bypass)
    error_message = "network_bypass must be either 'AzureServices' or 'None'."
  }
}

variable "ip_rules" {
  description = "List of public IPs/CIDRs permitted to access the Key Vault when network ACLs are enabled."
  type        = list(string)
  default     = []
}

variable "virtual_network_subnet_ids" {
  description = "List of subnet resource IDs permitted to access the Key Vault when network ACLs are enabled."
  type        = list(string)
  default     = []
}
