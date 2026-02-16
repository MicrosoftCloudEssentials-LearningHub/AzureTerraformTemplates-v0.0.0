# terraform.tfvars
# This file provides default values for the variables defined in variables.tf.
# These values can be overridden by specifying different values during Terraform execution.

resource_group_name = "my-resource-group"
location            = "East US"
sql_server_name     = "my-sql-server"
admin_username      = "adminuser"
admin_password      = "P@ssw0rd123"
sql_database_name   = "mydatabase"
sku_name            = "Basic"
subscription_id     = "your-subscription-id"
tags = {
  env = "dev"
}