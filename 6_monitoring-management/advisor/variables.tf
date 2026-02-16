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
  description = "The Azure region where the Resource Group will be created (Advisor alerts are global resources but live in a Resource Group)."
  type        = string

  validation {
    condition     = length(trimspace(var.location)) > 0
    error_message = "location must not be empty."
  }
}

variable "append_random_suffix" {
  description = "Whether to append a random suffix to names to reduce collisions."
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
  default     = "advisorAlert"
}

variable "action_group_short_name" {
  description = "Short name for the Action Group (max 12 characters)."
  type        = string
  default     = "advisor"

  validation {
    condition     = length(trimspace(var.action_group_short_name)) >= 1 && length(var.action_group_short_name) <= 12
    error_message = "action_group_short_name must be 1-12 characters."
  }
}

variable "activity_log_alert_name" {
  description = "Base name of the Activity Log Alert. If append_random_suffix is true, the final name will be '<base>-<suffix>'."
  type        = string
  default     = "AdvisorAlerts"
}

variable "email_address" {
  description = "Email address to receive Advisor recommendation alerts."
  type        = string

  validation {
    condition     = length(trimspace(var.email_address)) > 3 && can(regex("@", var.email_address))
    error_message = "email_address must look like an email address."
  }
}

variable "recommendation_category" {
  description = "Advisor recommendation category filter (for example: Cost, Performance, HighAvailability)."
  type        = string
  default     = "Cost"
}

variable "recommendation_impact" {
  description = "Advisor recommendation impact filter (for example: High, Medium, Low)."
  type        = string
  default     = "Medium"
}

variable "scope_resource_group_name" {
  description = "Optional resource group name to scope the Activity Log Alert to. If null, alert is scoped to the subscription."
  type        = string
  default     = null
}

variable "enabled" {
  description = "Whether the Activity Log Alert is enabled."
  type        = bool
  default     = true
}

variable "description" {
  description = "Optional description for the alert."
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
