# variables.tf
# This file defines the input variables used in the Terraform configuration.

variable "resource_group_name" {
  description = "The name of the Azure Resource Group to create and scope the Policy Assignment to."
  type        = string
}

variable "location" {
  description = "The Azure region where the Resource Group (and Managed Identity) will be created."
  type        = string
}

variable "managed_identity_name" {
  description = "The name of the User Assigned Managed Identity to create for the Policy Assignment."
  type        = string

  validation {
    condition     = length(trimspace(var.managed_identity_name)) > 0
    error_message = "managed_identity_name must not be empty."
  }
}

variable "policy_assignment_name" {
  description = "The name of the Azure Policy Assignment."
  type        = string

  validation {
    condition     = length(trimspace(var.policy_assignment_name)) > 0 && length(var.policy_assignment_name) <= 64
    error_message = "policy_assignment_name must be 1-64 characters."
  }
}

variable "policy_definition_id" {
  description = "The resource ID of the Policy Definition (built-in or custom) to assign. Example: /providers/Microsoft.Authorization/policyDefinitions/<id>"
  type        = string

  validation {
    condition     = length(trimspace(var.policy_definition_id)) > 0
    error_message = "policy_definition_id must not be empty."
  }
}

variable "policy_assignment_display_name" {
  description = "Optional display name for the Policy Assignment."
  type        = string
  default     = null
}

variable "policy_assignment_description" {
  description = "Optional description for the Policy Assignment."
  type        = string
  default     = null
}

variable "policy_parameters_json" {
  description = "Optional policy parameters JSON string. Example: jsonencode({ effect = { value = \"Audit\" } })"
  type        = string
  default     = null
}

variable "enforce" {
  description = "Whether the Policy Assignment should be enforced. Defaults to true."
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
