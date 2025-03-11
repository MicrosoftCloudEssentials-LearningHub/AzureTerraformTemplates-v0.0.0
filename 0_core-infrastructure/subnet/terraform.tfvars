# terraform.tfvars
# This file provides default values for the variables defined in variables.tf.
# It allows you to customize the configuration without modifying the variables file.

resource_group_name  = "example-resource-group"
vnet_name            = "example-vnet"
subnet_name          = "example-subnet"
location             = "East US"
address_space        = ["10.0.0.0/16"]
subnet_address_prefixes = ["10.0.1.0/24"]
subscription_id      = "your-subscription-id-here"
tags = {
  "project" = "example-project"
  "owner"   = "team-name"
}