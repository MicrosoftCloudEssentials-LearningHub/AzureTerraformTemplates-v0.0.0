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

variable "front_door_name" {
  description = "The name of the Azure Front Door Standard profile"
  type        = string
}

variable "backend_host" {
  description = "The backend host (FQDN or IP) where Front Door will route traffic"
  type        = string
}

variable "frontend_endpoint_name" {
  description = "The name of the Front Door frontend endpoint"
  type        = string
}

variable "health_probe_path" {
  description = "The path used for health probing"
  type        = string
  default     = "/"
}

variable "health_probe_protocol" {
  description = "The protocol for health probing (Http or Https)"
  type        = string
  default     = "Http"
}

variable "routing_rule_name" {
  description = "The name of the routing rule"
  type        = string
}

variable "accepted_protocols" {
  description = "List of accepted protocols for routing"
  type        = list(string)
  default     = ["Http", "Https"]
}

variable "patterns_to_match" {
  description = "URL patterns for request matching"
  type        = list(string)
  default     = ["/*"]
}
