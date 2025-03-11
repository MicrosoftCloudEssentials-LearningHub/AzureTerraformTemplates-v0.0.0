# variables.tf
# This file defines the input variables used in the Terraform configuration.
# Each variable includes a description, type, and optional default value.

variable "resource_group_name" {
  description = "The name of the Azure Resource Group to associate the Subnet with."
  type        = string
}

variable "vnet_name" {
  description = "The name of the Azure Virtual Network to associate the Subnet with."
  type        = string
}

variable "subnet_name" {
  description = "The name of the Azure Subnet to create."
  type        = string
}

variable "location" {
  description = "The Azure region where the Subnet will be created."
  type        = string
}

variable "address_space" {
  description = "The address space for the Virtual Network."
  type        = list(string)
}

variable "subnet_address_prefixes" {
  description = "The address prefixes for the Subnet."
  type        = list(string)
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