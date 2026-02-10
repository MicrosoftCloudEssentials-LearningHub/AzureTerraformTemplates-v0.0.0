# variables.tf
# This file defines the input variables used in the Terraform configuration.

variable "resource_group_name" {
  description = "The name of the resource group to create."
  type        = string

  validation {
    condition     = length(trimspace(var.resource_group_name)) > 0
    error_message = "resource_group_name must not be empty."
  }
}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string

  validation {
    condition     = length(trimspace(var.location)) > 0
    error_message = "location must not be empty."
  }
}

variable "cdn_profile_name" {
  description = "The name of the Front Door Profile."
  type        = string

  validation {
    condition     = length(trimspace(var.cdn_profile_name)) > 0
    error_message = "cdn_profile_name must not be empty."
  }
}

variable "cdn_sku" {
  description = "The SKU for the Front Door Profile. Possible values: Standard_AzureFrontDoor, Premium_AzureFrontDoor."
  type        = string
  default     = "Standard_AzureFrontDoor"
}

variable "cdn_endpoint_name" {
  description = "The name of the Front Door Endpoint."
  type        = string

  validation {
    condition     = length(trimspace(var.cdn_endpoint_name)) > 0
    error_message = "cdn_endpoint_name must not be empty."
  }
}

variable "origin_host" {
  description = "The hostname of the origin server (for example a Storage endpoint, App Service, or any HTTPS origin)."
  type        = string

  validation {
    condition     = length(trimspace(var.origin_host)) > 0
    error_message = "origin_host must not be empty."
  }
}

variable "tags" {
  description = "A map of tags to assign to supported resources."
  type        = map(string)
  default     = {}
}
