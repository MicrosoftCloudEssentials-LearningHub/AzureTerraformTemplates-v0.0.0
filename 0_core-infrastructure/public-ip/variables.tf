# variables.tf
# This file defines the input variables used in the Terraform configuration.
# Each variable includes a description, type, and optional default value.

variable "resource_group_name" {
  description = "The name of the Azure Resource Group to associate the Public IP with."
  type        = string
}

variable "public_ip_name" {
  description = "The name of the Azure Public IP to create."
  type        = string
}

variable "location" {
  description = "The Azure region where the Public IP will be created."
  type        = string
}

variable "allocation_method" {
  description = "The allocation method for the Public IP (Static or Dynamic)."
  type        = string
  default     = "Static"
}

variable "sku" {
  description = "The SKU of the Public IP (Basic or Standard)."
  type        = string
  default     = "Basic"
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}

variable "subscription_id" {
  description = "The Azure subscription ID to use for the AzureRM provider."
  type        = string
}