variable "resource_group_name" {
  description = "The name of the Azure Resource Group to associate the App Service with."
  type        = string
}

variable "location" {
  description = "The Azure region where the Resource Group will be created."
  type        = string
}

variable "app_service_plan_name" {
  description = "The name of the Azure App Service Plan to create."
  type        = string
}

variable "app_service_name" {
  description = "The name of the Azure App Service to create."
  type        = string
}

variable "app_service_sku" {
  description = "The SKU of the App Service Plan."
  type        = string
}

variable "runtime_stack" {
  description = "The runtime stack for the App Service."
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