variable "subscription_id" {
  description = "The subscription ID for Azure"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Azure Resource Group to associate the Virtual Machine with."
  type        = string
}

variable "location" {
  description = "The Azure region where the Resource Group will be created."
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the Azure Virtual Network to create."
  type        = string
}

variable "subnet_name" {
  description = "The name of the Subnet to create within the Virtual Network."
  type        = string
}

variable "vm_name" {
  description = "The name of the Virtual Machine to create."
  type        = string
}

variable "vm_size" {
  description = "The size of the Virtual Machine."
  type        = string
}

variable "admin_username" {
  description = "The administrator username for the Virtual Machine."
  type        = string
}

variable "admin_password" {
  description = "The administrator password for the Virtual Machine."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
}
