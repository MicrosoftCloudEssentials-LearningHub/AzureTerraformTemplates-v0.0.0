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

variable "public_ip_name" {
  description = "The name of the public IP address for the VPN Gateway"
  type        = string
}

variable "vpn_gateway_name" {
  description = "The name of the VPN Gateway"
  type        = string
}

variable "vpn_gateway_sku" {
  description = "The SKU for the VPN Gateway (e.g., VpnGw1, VpnGw2)"
  type        = string
  default     = "VpnGw1"
}
