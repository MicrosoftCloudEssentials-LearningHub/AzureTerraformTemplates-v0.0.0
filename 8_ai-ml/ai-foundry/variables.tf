variable "resource_group_name" {
  description = "The name of the Azure Resource Group to deploy into. This template will create the RG if it does not exist (idempotent ARM PUT)."
  type        = string

  validation {
    condition     = length(trimspace(var.resource_group_name)) > 0
    error_message = "resource_group_name must not be empty."
  }
}

variable "location" {
  description = "The Azure region for the deployment."
  type        = string

  validation {
    condition     = length(trimspace(var.location)) > 0
    error_message = "location must not be empty."
  }
}

variable "append_random_suffix" {
  description = "Whether to append a random suffix to names to reduce naming collisions."
  type        = bool
  default     = true
}

variable "random_suffix_length" {
  description = "Length of the random suffix appended when append_random_suffix is true."
  type        = number
  default     = 6

  validation {
    condition     = var.random_suffix_length >= 4 && var.random_suffix_length <= 16
    error_message = "random_suffix_length must be between 4 and 16."
  }
}

variable "foundry_account_name" {
  description = "Base name for the Microsoft Foundry account (Cognitive Services account kind 'AIServices'). If append_random_suffix is true, the final name will be '<base>-<suffix>'."
  type        = string

  validation {
    condition     = length(trimspace(var.foundry_account_name)) >= 2 && length(var.foundry_account_name) <= 48
    error_message = "foundry_account_name must be between 2 and 48 characters to leave room for optional '-<suffix>'."
  }
}

variable "sku_name" {
  description = "SKU name (for example: S0)."
  type        = string
  default     = "S0"
}

variable "allow_project_management" {
  description = "Enable/Disable project management for Foundry. Must be true to create projects under the account."
  type        = bool
  default     = true
}

variable "custom_subdomain_name" {
  description = "Optional custom subdomain for token-based auth. Some configurations require this. If null, a default value is derived from the account name."
  type        = string
  default     = null
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled for the Foundry account."
  type        = bool
  default     = true
}

variable "create_project" {
  description = "Whether to create a Foundry project under the account."
  type        = bool
  default     = true
}

variable "project_name" {
  description = "Name of the Foundry project resource (2-64, pattern: ^[a-zA-Z0-9][a-zA-Z0-9_.-]*$). If null and create_project is true, a default value is derived."
  type        = string
  default     = null
}

variable "project_display_name" {
  description = "Display name for the project."
  type        = string
  default     = null
}

variable "project_description" {
  description = "Description for the project."
  type        = string
  default     = ""
}

variable "enable_system_assigned_identity" {
  description = "Whether to enable a System Assigned Managed Identity on the Foundry account."
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
  default     = {}
}
