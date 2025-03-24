variable "resource_group_name" {
  description = "The name of the Azure Resource Group to associate the AVD environment with."
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

variable "workspace_name" {
  description = "The name of the Azure Virtual Desktop Workspace to create."
  type        = string
}

variable "host_pool_name" {
  description = "The name of the Azure Virtual Desktop Host Pool to create."
  type        = string
}

variable "vm_size" {
  description = "The size of the Virtual Machines for the session hosts."
  type        = string
}

variable "admin_username" {
  description = "The administrator username for the session hosts."
  type        = string
}

variable "admin_password" {
  description = "The administrator password for the session hosts."
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
