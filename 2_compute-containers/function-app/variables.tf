variable "resource_group_name" {
  description = "The name of the Azure Resource Group to associate the Function App with."
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

variable "app_service_plan_name" {
  description = "The name of the Azure App Service Plan to create."
  type        = string
}

variable "function_app_name" {
  description = "The name of the Azure Function App to create."
  type        = string
}

variable "runtime_stack" {
  description = "The runtime stack for the Function App."
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