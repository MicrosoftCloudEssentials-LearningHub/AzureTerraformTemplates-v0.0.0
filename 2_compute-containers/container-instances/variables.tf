variable "resource_group_name" {
  description = "The name of the Azure Resource Group to associate the Container Instances with."
  type        = string
}

variable "location" {
  description = "The Azure region where the Resource Group will be created."
  type        = string
}

variable "container_group_name" {
  description = "The name of the Azure Container Group to create."
  type        = string
}

variable "container_name" {
  description = "The name of the Container to create within the Container Group."
  type        = string
}

variable "image" {
  description = "The Docker image to use for the Container."
  type        = string
}

variable "cpu_cores" {
  description = "The number of CPU cores to allocate to the Container."
  type        = number
}

variable "memory_in_gb" {
  description = "The amount of memory in GB to allocate to the Container."
  type        = number
}

variable "port" {
  description = "The port to expose on the Container."
  type        = number
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
}

variable "subscription_id" {
  description = "The subscription ID for Azure"
  type        = string
}
