variable "resource_group_name" {
  description = "The name of the Resource Group to associate the databases with."
  type        = string
}

variable "location" {
  description = "The region where the Resource Group will be created."
  type        = string
}

variable "database_server_name" {
  description = "The name of the Database Server to create."
  type        = string
}

variable "mysql_database_name" {
  description = "The name of the MySQL database to create."
  type        = string
}

variable "postgresql_database_name" {
  description = "The name of the PostgreSQL database to create."
  type        = string
}

variable "mariadb_database_name" {
  description = "The name of the MariaDB database to create."
  type        = string
}

variable "subscription_id" {
  description = "The subscription ID to use for the provider."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
}
