# terraform.tfvars
# This file provides default values for the variables defined in variables.tf.
# These values can be overridden by specifying different values during Terraform execution.

# Azure Subscription
subscription_id = "" # your-subscription-id

# Resource Group
resource_group_name = "RG-appgateway-test"  # your-resource-group-name
location = "eastus"

# Application Gateway Configuration
public_ip_name         = "demo-public-ip"
app_gateway_name       = "demo-app-gateway"

vnet_name              = "demo-vnet"
vnet_address_space     = ["10.0.0.0/16"] # your-vnet-address-space

subnet_name            = "demo-subnet"
subnet_address_prefixes = ["10.0.1.0/24"] # your-subnet-address-prefix
