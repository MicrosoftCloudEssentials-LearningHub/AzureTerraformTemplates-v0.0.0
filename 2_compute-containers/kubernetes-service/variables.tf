variable "resource_group_name" {
  description = "The name of the Azure Resource Group to associate the AKS cluster with."
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

variable "aks_cluster_name" {
  description = "The name of the AKS cluster to create."
  type        = string
}

variable "kubernetes_version" {
  description = "The version of Kubernetes to use for the AKS cluster."
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the AKS cluster."
  type        = number
}

variable "node_vm_size" {
  description = "The size of the Virtual Machines for the nodes."
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
