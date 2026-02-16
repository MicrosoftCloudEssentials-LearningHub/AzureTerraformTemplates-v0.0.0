# terraform.tfvars
# This file provides default values for the variables defined in variables.tf.
# These values can be overridden by specifying different values during Terraform execution.

resource_group_name     = "my-resource-group"
location                = "East US"
vnet_name               = "my-vnet"
vnet_address_space      = ["10.0.0.0/16"]
subnet_name             = "my-subnet"
subnet_address_prefixes = ["10.0.1.0/24"]
public_ip_name          = "my-public-ip"
bastion_name            = "my-bastion"
subscription_id         = "your-subscription-id"
tags = {
  env = "dev"
}