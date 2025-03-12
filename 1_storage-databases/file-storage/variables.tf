# variables.tf
# This file defines the input variables used in the Terraform configuration.
# Each variable includes a description and type.

variable "resource_group_name" {
  description = "The name of the Azure Resource Group to associate the Storage Account and File Share with."
  type        = string
}

variable "location" {
  description = "The Azure region where the Resource Group will be created."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the Azure Storage Account to create."
  type        = string
}

variable "account_tier" {
  description = "The tier to use for the Storage Account (Standard or Premium)."
  type        = string
}

variable "account_replication_type" {
  description = "The replication type to use for the Storage Account (LRS, GRS, RAGRS, ZRS)."
  type        = string
}

variable "share_name" {
  description = "The name of the File Share to create."
  type        = string
}

variable "share_quota" {
  description = "The quota for the File Share in GB."
  type        = number
}

variable "subscription_id" {
  description = "The Azure subscription ID to use for the AzureRM provider."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
}