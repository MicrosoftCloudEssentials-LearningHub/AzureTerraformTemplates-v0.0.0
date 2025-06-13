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

variable "vault_name" {
  description = "The name of the Recovery Services Vault"
  type        = string
}

variable "sku" {
  description = "The SKU for the Recovery Services Vault (Standard or RS0)"
  type        = string
  default     = "Standard"
}

variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
  default     = {}
}