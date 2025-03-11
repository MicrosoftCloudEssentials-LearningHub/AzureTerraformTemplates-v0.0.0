# terraform.tfvars
# This file provides default values for the variables defined in variables.tf.
# It allows you to customize the configuration without modifying the variables file.

vnet_name           = "example-vnet"
resource_group_name = "example-resource-group"
location            = "East US"
address_space       = ["10.0.0.0/16"]
subscription_id     = "your-subscription-id-here"
tags = {
  "project" = "example-project"
  "owner"   = "team-name"
}