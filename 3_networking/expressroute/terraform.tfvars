# terraform.tfvars
# This file provides default values for the variables defined in variables.tf.
# These values can be overridden by specifying different values during Terraform execution.

# Azure Subscription
subscription_id = "" # "your-subscription-id"

# Resource Group
resource_group_name = "RG-expressroute-test"
location            = "eastus"

# ExpressRoute Configuration
expressroute_name     = "my-expressroute"
service_provider_name = "Equinix"
peering_location      = "Silicon Valley"
bandwidth_in_mbps     = 200
sku_tier              = "Standard"
sku_family            = "MeteredData"