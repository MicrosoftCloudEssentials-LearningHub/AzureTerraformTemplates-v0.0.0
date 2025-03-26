variable "azure_subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Azure resource group"
  type        = string
}

variable "vnet_name" {
  description = "The name of the Azure virtual network"
  type        = string
}

variable "atlas_cidr_block" {
  description = "The CIDR block for the Atlas network"
  type        = string
}

variable "location" {
  description = "The location/region where the resources will be created"
  type        = string
}

variable "mongodbatlas_org_id" {
  description = "The organization ID for MongoDB Atlas"
  type        = string
}

variable "azure_directory_id" {
  description = "The Azure directory ID"
  type        = string
}
