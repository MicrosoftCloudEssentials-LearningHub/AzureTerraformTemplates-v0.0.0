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

variable "workspace_name" {
  description = "Base name of the Azure Machine Learning workspace. If append_random_suffix is true, the final name will be '<base>-<suffix>'."
  type        = string

  validation {
    condition     = length(trimspace(var.workspace_name)) >= 3 && length(var.workspace_name) <= 64
    error_message = "workspace_name must be between 3 and 64 characters."
  }
}

variable "storage_account_name_prefix" {
  description = "Prefix used to generate the Storage Account name for the AML workspace (will be sanitized to meet naming rules)."
  type        = string
  default     = "stml"
}

variable "key_vault_name_prefix" {
  description = "Prefix used to generate the Key Vault name for the AML workspace (will be sanitized to meet naming rules)."
  type        = string
  default     = "kvml"
}

variable "container_registry_name_prefix" {
  description = "Prefix used to generate the Container Registry name for the AML workspace (will be sanitized to meet naming rules)."
  type        = string
  default     = "acrml"
}

variable "application_insights_name_prefix" {
  description = "Prefix used to generate the Application Insights name for the AML workspace."
  type        = string
  default     = "appi-ml"
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled for the Azure Machine Learning workspace."
  type        = bool
  default     = true
}

variable "enable_system_assigned_identity" {
  description = "Whether to enable a System Assigned Managed Identity on the Azure Machine Learning workspace."
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
  default     = {}
}
