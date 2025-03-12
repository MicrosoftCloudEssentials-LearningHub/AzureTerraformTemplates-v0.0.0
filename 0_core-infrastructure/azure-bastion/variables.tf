# variables.tf
# This file defines the input variables used in the Terraform configuration.
# Each variable includes a description and type.

variable "subscription_id" {
  description = "The Azure subscription ID to use for the AzureRM provider."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Azure Resource Group to associate the Bastion Host with."
  type        = string
}

variable "location" {
  description = "The Azure region where the Resource Group will be created."
  type        = string
}

variable "vnet_name" {
  description = "The name of the Virtual Network."
  type        = string
}

variable "vnet_address_space" {
  description = "The address space for the Virtual Network."
  type        = list(string)
}

variable "subnet_name" {
  description = "The name of the Subnet."
  type        = string
}

variable "subnet_address_prefixes" {
  description = "The address prefixes for the Subnet."
  type        = list(string)
}

variable "public_ip_name" {
  description = "The name of the Public IP."
  type        = string
}

variable "bastion_name" {
  description = "The name of the Bastion Host."
  type        = string
}

variable "bastion_dns_name" {
  description = "The DNS name for the Bastion Host."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
}