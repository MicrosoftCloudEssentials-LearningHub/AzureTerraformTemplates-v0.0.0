variable "resource_group_name" {
  description = "The name of the Azure Resource Group to associate the Batch environment with."
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

variable "batch_account_name" {
  description = "The name of the Azure Batch Account to create."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
}

variable "subscription_id" {
  description = "The subscription ID for Azure"
  type        = string
}