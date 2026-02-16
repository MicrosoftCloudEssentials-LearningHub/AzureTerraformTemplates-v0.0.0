# variables.tf

variable "resource_group_name" {
  description = "The name of the Azure Resource Group to deploy into. This template will create the RG if it does not exist (idempotent ARM PUT)."
  type        = string

  validation {
    condition     = length(trimspace(var.resource_group_name)) > 0
    error_message = "resource_group_name must not be empty."
  }
}

variable "location" {
  description = "The Azure region where the Resource Group and Log Analytics workspace will be created."
  type        = string

  validation {
    condition     = length(trimspace(var.location)) > 0
    error_message = "location must not be empty."
  }
}

variable "append_random_suffix" {
  description = "Whether to append a random suffix to the workspace name to reduce naming collisions."
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
  description = "Base name of the Log Analytics workspace. If append_random_suffix is true, the final name will be '<base>-<suffix>'."
  type        = string

  validation {
    condition = (
      length(trimspace(var.workspace_name)) >= 4
      && length(var.workspace_name) <= (var.append_random_suffix ? (63 - 1 - var.random_suffix_length) : 63)
      && can(regex("^[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$", var.workspace_name))
    )
    error_message = "workspace_name must be 4-63 chars, contain only alphanumeric or '-', start/end with alphanumeric, and leave room for '-<suffix>' when append_random_suffix is true."
  }
}

variable "sku" {
  description = "The Log Analytics workspace SKU."
  type        = string
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "Data retention in days."
  type        = number
  default     = 30

  validation {
    condition     = var.retention_in_days >= 30 && var.retention_in_days <= 730
    error_message = "retention_in_days must be between 30 and 730."
  }
}

variable "daily_quota_gb" {
  description = "Daily ingestion cap in GB. Use -1 for unlimited."
  type        = number
  default     = -1
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}

variable "use_current_user_as_admin" {
  description = "If true (and admin_members is empty), assigns Log Analytics Contributor on the workspace to the currently signed-in user."
  type        = bool
  default     = true
}

variable "admin_members" {
  description = "Optional override list of Entra ID user principal names (UPNs) to grant Log Analytics Contributor on the workspace. If provided, use_current_user_as_admin is ignored."
  type        = list(string)
  default     = []
}

variable "admin_role_definition_name" {
  description = "Built-in role to grant to admin members on the Log Analytics workspace."
  type        = string
  default     = "Log Analytics Contributor"
}
