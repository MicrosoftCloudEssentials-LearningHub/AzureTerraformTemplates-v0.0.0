# terraform.tfvars
# This file provides default values for the variables defined in variables.tf.
# It allows you to customize the configuration without modifying the variables file.

resource_group_name = "example-resource-group"
public_ip_name      = "example-public-ip"
location            = "East US"
allocation_method   = "Static"
sku                 = "Basic"
subscription_id     = "your-subscription-id-here"
tags = {
  "project" = "example-project"
  "owner"   = "team-name"
}