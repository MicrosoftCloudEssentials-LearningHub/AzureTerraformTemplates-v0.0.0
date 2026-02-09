# variables.tf
# This file defines the input variables used in the Terraform configuration.

variable "resource_group_name" {
  description = "The name of the Azure Resource Group to create and place the Managed Identity in."
  type        = string
}

variable "location" {
  description = "The Azure region where the Resource Group (and Managed Identity) will be created."
  type        = string
}

variable "managed_identity_name" {
  description = "The name of the User Assigned Managed Identity to create."
  type        = string

  validation {
    condition     = length(trimspace(var.managed_identity_name)) > 0
    error_message = "managed_identity_name must not be empty."
  }
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
