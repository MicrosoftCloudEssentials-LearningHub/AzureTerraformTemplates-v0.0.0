# terraform.tfvars
# This file provides default values for the variables defined in variables.tf.
# These values can be overridden by specifying different values during Terraform execution.

resource_group_name          = "example-resources"
location                     = "West US"
mysql_flexible_server_name   = "mysqlflexbrownx0"
administrator_login          = "adminuser"
administrator_password       = "P@ssw0rd1234!"
sku_name                     = "GP_Standard_D2ds_v4"
mysql_version                = "8.0.21"
backup_retention_days        = 7
high_availability_mode       = "SameZone"
maintenance_window_day_of_week = 0
maintenance_window_start_hour = 8
maintenance_window_start_minute = 0
storage_iops                 = 360
storage_size_gb              = 20
subscription_id         =  "your-subscription-id"
