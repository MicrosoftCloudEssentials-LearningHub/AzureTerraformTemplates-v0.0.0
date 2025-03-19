variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "mysql_flexible_server_name" {
  description = "The name of the MySQL server name"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  type        = string
}

variable "administrator_login" {
  description = "The administrator login for the MySQL server"
  type        = string
}

variable "administrator_password" {
  description = "The administrator password for the MySQL server"
  type        = string
}

variable "sku_name" {
  description = "The SKU name for the MySQL server"
  type        = string
  default     = "GP_Standard_D2ds_v4"
}

variable "mysql_version" {
  description = "The version of MySQL"
  type        = string
  default     = "8.0.21"
}

variable "backup_retention_days" {
  description = "The number of days to retain backups"
  type        = number
  default     = 7
}

variable "high_availability_mode" {
  description = "The high availability mode"
  type        = string
  default     = "SameZone"
}

variable "maintenance_window_day_of_week" {
  description = "The day of the week for maintenance"
  type        = number
  default     = 0
}

variable "maintenance_window_start_hour" {
  description = "The start hour for maintenance"
  type        = number
  default     = 8
}

variable "maintenance_window_start_minute" {
  description = "The start minute for maintenance"
  type        = number
  default     = 0
}

variable "storage_iops" {
  description = "The IOPS for the storage"
  type        = number
  default     = 360
}

variable "storage_size_gb" {
  description = "The size of the storage in GB"
  type        = number
  default     = 20
}

variable "subscription_id" {
  description = "The Azure subscription ID to use for the AzureRM provider."
  type        = string
}
