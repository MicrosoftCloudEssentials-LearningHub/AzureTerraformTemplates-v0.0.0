# variables.tf
# This file defines the input variables used in the Terraform configuration.
# Each variable includes a description and type.

variable "resource_group_name" {
  description = "The name of the Azure Resource Group to associate the SQL Database with."
  type        = string
}

variable "location" {
  description = "The Azure region where the Resource Group will be created."
  type        = string
}

variable "sql_server_name" {
  description = "The name of the Azure SQL Server to create."
  type        = string
}

variable "admin_username" {
  description = "The administrator login name for the SQL Server."
  type        = string
}

variable "admin_password" {
  description = "The administrator login password for the SQL Server."
  type        = string
}

variable "sql_database_name" {
  description = "The name of the Azure SQL Database to create."
  type        = string
}

variable "sku_name" {
  description = "The SKU name for the SQL Database (e.g., Basic, S0, S1, P1)."
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