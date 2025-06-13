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

variable "cdn_profile_name" {
  description = "The name of the CDN profile"
  type        = string
}

variable "cdn_sku" {
  description = "The SKU for the CDN profile (Standard_Microsoft, Standard_Akamai, Standard_Verizon, Premium_Verizon)"
  type        = string
  default     = "Standard_Microsoft"
}

variable "cdn_endpoint_name" {
  description = "The name of the CDN endpoint"
  type        = string
}

variable "origin_host" {
  description = "The hostname of the origin server"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
  default     = {}
}