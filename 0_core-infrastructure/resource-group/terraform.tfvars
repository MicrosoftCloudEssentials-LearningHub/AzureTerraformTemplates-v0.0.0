# terraform.tfvars
# This file provides default values for the variables defined in variables.tf.
# It allows you to customize the configuration without modifying the variables file.

resource_group_name = "example-resource-group"
location            = "East US"
subscription_id     = "your-subscription-id-here"
tags = {
  "project" = "example-project"
  "owner"   = "team-name"
}
