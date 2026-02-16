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
  description = "The Azure region where the Resource Group and Automation Account will be created."
  type        = string

  validation {
    condition     = length(trimspace(var.location)) > 0
    error_message = "location must not be empty."
  }
}

variable "append_random_suffix" {
  description = "Whether to append a random suffix to the Automation Account name to reduce naming collisions."
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

variable "automation_account_name" {
  description = "Base name of the Automation Account. If append_random_suffix is true, the final name will be '<base>-<suffix>'."
  type        = string

  validation {
    condition = (
      length(trimspace(var.automation_account_name)) > 0
      && length(var.automation_account_name) <= (var.append_random_suffix ? (50 - 1 - var.random_suffix_length) : 50)
      && can(regex("^[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$", var.automation_account_name))
    )
    error_message = "automation_account_name must be 1-50 chars, contain only alphanumeric or '-', start/end with alphanumeric, and leave room for '-<suffix>' when append_random_suffix is true."
  }
}

variable "sku_name" {
  description = "Automation Account SKU."
  type        = string
  default     = "Basic"
}

variable "enable_system_assigned_identity" {
  description = "Whether to enable a System Assigned Managed Identity on the Automation Account."
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
