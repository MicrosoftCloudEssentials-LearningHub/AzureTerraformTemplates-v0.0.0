# terraform.tfvars
# This file provides default values for the variables defined in variables.tf.
# These values can be overridden by specifying different values during Terraform execution.

# Azure Subscription
subscription_id = "" # "your-subscription-id"

# Resource Group
resource_group_name = "RG-vpn-gateway-test"
location            = "eastus"

# VPN Gateway Configuration
public_ip_name   = "my-vpngw-pip"
vpn_gateway_name = "my-vpngw"
vpn_gateway_sku  = "VpnGw1"