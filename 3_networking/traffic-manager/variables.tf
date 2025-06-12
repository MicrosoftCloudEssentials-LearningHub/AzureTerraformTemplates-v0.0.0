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
  description = "The Azure region for the resource group"
  type        = string
}

variable "traffic_manager_name" {
  description = "The name of the Traffic Manager profile"
  type        = string
}

variable "traffic_routing_method" {
  description = "The traffic routing method (e.g., Performance, Priority, Weighted, Geographic, MultiValue, Subnet)"
  type        = string
  default     = "Performance"
}

variable "dns_name" {
  description = "The relative DNS name for the Traffic Manager profile"
  type        = string
}

variable "ttl" {
  description = "The DNS Time-To-Live (TTL) in seconds"
  type        = number
  default     = 30
}

variable "monitor_protocol" {
  description = "The protocol used for endpoint monitoring (HTTP, HTTPS, TCP)"
  type        = string
  default     = "HTTP"
}

variable "monitor_port" {
  description = "The port used for endpoint monitoring"
  type        = number
  default     = 80
}

variable "monitor_path" {
  description = "The path used for endpoint monitoring"
  type        = string
  default     = "/"
}
