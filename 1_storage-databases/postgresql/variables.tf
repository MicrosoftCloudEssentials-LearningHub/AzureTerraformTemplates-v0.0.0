# File for declaring input variables
variable "subscription_id" {
  description = "The subscription ID for Azure"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location/region where the resources will be created"
  type        = string
}

variable "postgresql_server_name" {
  description = "The name of the PostgreSQL server"
  type        = string
}

variable "admin_username" {
  description = "The administrator username for the PostgreSQL server"
  type        = string
}

variable "admin_password" {
  description = "The administrator password for the PostgreSQL server"
  type        = string
  sensitive   = true
}

variable "ssl_enforcement_enabled" {
  description = "Whether SSL enforcement is enabled"
  type        = bool
}

