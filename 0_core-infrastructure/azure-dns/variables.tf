# variables.tf
# This file defines the input variables used in the Terraform configuration.
# Each variable includes a description and type.

variable "resource_group_name" {
  description = "The name of the Azure Resource Group to associate the DNS Zone with."
  type        = string
}

variable "dns_zone_name" {
  description = "The name of the Azure DNS Zone to create."
  type        = string
}

variable "location" {
  description = "The Azure region where the Resource Group will be created."
  type        = string
}

variable "subscription_id" {
  description = "The Azure subscription ID to use for the AzureRM provider."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
}