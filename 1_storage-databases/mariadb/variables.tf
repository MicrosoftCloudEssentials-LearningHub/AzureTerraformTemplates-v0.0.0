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

variable "mariadb_server_name" {
  description = "The name of the MariaDB server"
  type        = string
}

variable "admin_username" {
  description = "The administrator username for the MariaDB server"
  type        = string
}

variable "admin_password" {
  description = "The administrator password for the MariaDB server"
  type        = string
  sensitive   = true
}

variable "sku_name" {
  description = "The SKU name for the MariaDB server"
  type        = string
}

variable "mariadb_version" {
  description = "The version of MariaDB"
  type        = string
}

variable "backup_retention_days" {
  description = "The number of days to retain backups"
  type        = number
}

variable "geo_redundant_backup_enabled" {
  description = "Whether geo-redundant backup is enabled"
  type        = bool
}

variable "auto_grow_enabled" {
  description = "Whether auto-grow is enabled"
  type        = bool
}

variable "ssl_enforcement_enabled" {
  description = "Whether SSL enforcement is enabled"
  type        = bool
}
