# terraform.tfvars
# This file provides default values for the variables defined in variables.tf.
# These values can be overridden by specifying different values during Terraform execution.

resource_group_name     = "my-resource-group"
location                = "East US"
database_server_name    = "mydbserver"
mysql_database_name     = "mysql_db"
postgresql_database_name = "postgresql_db"
mariadb_database_name   = "mariadb_db"
subscription_id         = "your-subscription-id"
tags                    = {
  env = "dev"
}
