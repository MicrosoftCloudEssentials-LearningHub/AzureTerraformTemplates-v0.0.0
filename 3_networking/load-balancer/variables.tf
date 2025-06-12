# variables.tf
# This file defines the input variables used in the Terraform configuration.
# Each variable includes a description and type.

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

variable "load_balancer_name" {
  description = "The name of the load balancer"
  type        = string
}

variable "public_ip_name" {
  description = "The name of the public IP address"
  type        = string
}

variable "frontend_ip_configuration_name" {
  description = "Name of the frontend IP configuration"
  type        = string
  default     = "frontend-ip-config"
}

variable "backend_pool_name" {
  description = "Name of the backend address pool"
  type        = string
  default     = "backend-pool"
}

variable "health_probe_name" {
  description = "Name of the health probe"
  type        = string
  default     = "health-probe"
}

variable "lb_rule_name" {
  description = "Name of the load balancer rule"
  type        = string
  default     = "lb-rule"
}

variable "lb_sku" {
  description = "SKU of the load balancer (Basic or Standard)"
  type        = string
  default     = "Standard"
}

variable "probe_protocol" {
  description = "Protocol for health probe"
  type        = string
  default     = "Tcp"
}

variable "probe_port" {
  description = "Port for health probe"
  type        = number
  default     = 80
}

variable "frontend_port" {
  description = "Frontend port for load balancer rule"
  type        = number
  default     = 80
}

variable "backend_port" {
  description = "Backend port for load balancer rule"
  type        = number
  default     = 80
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
