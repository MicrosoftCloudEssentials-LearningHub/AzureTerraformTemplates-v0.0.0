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

variable "sku_capacity" {
  description = "The capacity for the SKU"
  type        = number
}

variable "sku_family" {
  description = "The family for the SKU"
  type        = string
}

variable "sku_name" {
  description = "The name for the SKU"
  type        = string
}

variable "sku_size" {
  description = "The size for the SKU"
  type        = string
}

variable "sku_tier" {
  description = "The tier for the SKU"
  type        = string
}

variable "minimal_tls_version" {
  description = "The minimal TLS version"
  type        = string
}

variable "public_network_access" {
  description = "The public network access setting"
  type        = string
}

variable "ssl_enforcement" {
  description = "The SSL enforcement setting"
  type        = string
}

variable "backup_retention_days" {
  description = "The number of days to retain backups"
  type        = number
}

variable "geo_redundant_backup" {
  description = "Whether geo-redundant backup is enabled"
  type        = string
}

variable "storage_autogrow" {
  description = "Whether storage autogrow is enabled"
  type        = string
}

variable "storage_mb" {
  description = "The storage size in MB"
  type        = number
}

variable "mariadb_version" {
  description = "The version of MariaDB"
  type        = string
}
