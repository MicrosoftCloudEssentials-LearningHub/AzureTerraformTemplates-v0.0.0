# terraform.tfvars
# This file provides default values for the variables defined in variables.tf.
# These values can be overridden by specifying different values during Terraform execution.

# Azure Subscription
subscription_id = "" # "your-subscription-id"

# Resource Group
resource_group_name = "RG-firewall-test"
location            = "eastus"

# Azure Firewall Configuration
firewall_name      = "my-azfw"
public_ip_name     = "my-azfw-pip"
vnet_name          = "my-azfw-vnet"
vnet_address_space = ["10.0.0.0/16"]

# Subnet Configuration
subnet_name             = "AzureFirewallSubnet"
subnet_address_prefixes = ["10.0.1.0/26"]
