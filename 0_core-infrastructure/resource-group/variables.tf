# variables.tf
# This file defines the input variables used in the Terraform configuration.
# Each variable includes a description, type, and optional default value.

variable "resource_group_name" {
  description = "The name of the Azure Resource Group to create."
  type        = string
}

variable "location" {
  description = "The Azure region where the Resource Group will be created."
  type        = string
}

variable "environment" {
  description = "The environment for the Resource Group (e.g., dev, prod)."
  type        = string
}

variable "enable_logging" {
  description = "Whether to enable logging for the Resource Group."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to assign to the Resource Group."
  type        = map(string)
  default     = {}
}
