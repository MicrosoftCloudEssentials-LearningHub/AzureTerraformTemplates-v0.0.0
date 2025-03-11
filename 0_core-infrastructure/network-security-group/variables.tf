# variables.tf
# This file defines the input variables used in the Terraform configuration.
# Each variable includes a description, type, and optional default value.

variable "resource_group_name" {
  description = "The name of the Azure Resource Group to associate the NSG with."
  type        = string
}

variable "nsg_name" {
  description = "The name of the Azure Network Security Group to create."
  type        = string
}

variable "location" {
  description = "The Azure region where the NSG will be created."
  type        = string
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