# variables.tf
# This file defines the input variables used in the Terraform configuration.

variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
}

variable "backup_vault_name" {
  description = "The name of the Data Protection Backup Vault"
  type        = string
}

variable "redundancy" {
  description = "The redundancy setting for the backup vault (LocallyRedundant, GeoRedundant)"
  type        = string
  default     = "LocallyRedundant"
}

variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
  default     = {}
}