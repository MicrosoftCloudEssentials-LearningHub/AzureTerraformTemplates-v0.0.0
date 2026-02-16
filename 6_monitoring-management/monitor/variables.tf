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
  description = "The Azure region where the Resource Group will be created (Action Groups are global, but must live in a Resource Group)."
  type        = string

  validation {
    condition     = length(trimspace(var.location)) > 0
    error_message = "location must not be empty."
  }
}

variable "append_random_suffix" {
  description = "Whether to append a random suffix to the Action Group name to reduce naming collisions."
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

variable "action_group_name" {
  description = "Base name of the Action Group. If append_random_suffix is true, the final name will be '<base>-<suffix>'."
  type        = string

  validation {
    condition = (
      length(trimspace(var.action_group_name)) > 0
      && length(var.action_group_name) <= (80 - (var.append_random_suffix ? (1 + var.random_suffix_length) : 0))
      && can(regex("^[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$", var.action_group_name))
    )
    error_message = "action_group_name must be 1-80 chars, contain only alphanumeric or '-', start/end with alphanumeric, and leave room for '-<suffix>' when append_random_suffix is true."
  }
}

variable "action_group_short_name" {
  description = "Short name for the Action Group (max 12 characters)."
  type        = string
  default     = "alerts"

  validation {
    condition     = length(trimspace(var.action_group_short_name)) >= 1 && length(var.action_group_short_name) <= 12
    error_message = "action_group_short_name must be 1-12 characters."
  }
}

variable "email_address" {
  description = "Optional single email address to receive Azure Monitor notifications. Prefer use_current_user_as_admin/admin_members for Terraform-native orchestration."
  type        = string
  default     = null
}

variable "use_current_user_as_admin" {
  description = "If true (and admin_members/email_address are not set), uses the currently signed-in user's UPN as the email receiver."
  type        = bool
  default     = true
}

variable "admin_members" {
  description = "Optional override list of email addresses/UPNs to receive Azure Monitor notifications. If provided, use_current_user_as_admin is ignored."
  type        = list(string)
  default     = []
}

variable "use_common_alert_schema" {
  description = "Whether to use the common alert schema for the email receiver."
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
