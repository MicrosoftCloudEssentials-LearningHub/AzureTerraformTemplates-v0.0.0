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

variable "expressroute_name" {
  description = "The name of the ExpressRoute circuit"
  type        = string
}

variable "service_provider_name" {
  description = "The name of the ExpressRoute service provider"
  type        = string
}

variable "peering_location" {
  description = "The peering location for the ExpressRoute circuit"
  type        = string
}

variable "bandwidth_in_mbps" {
  description = "The bandwidth in Mbps for the ExpressRoute circuit"
  type        = number
}

variable "sku_tier" {
  description = "The SKU tier for ExpressRoute (Standard or Premium)"
  type        = string
  default     = "Standard"
}

variable "sku_family" {
  description = "The SKU family for ExpressRoute (MeteredData or UnlimitedData)"
  type        = string
  default     = "MeteredData"
}
