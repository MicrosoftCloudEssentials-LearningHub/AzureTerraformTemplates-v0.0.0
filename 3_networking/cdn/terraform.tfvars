# terraform.tfvars
# This file provides default values for the variables defined in variables.tf.
# These values can be overridden by specifying different values during Terraform execution.

# Azure Subscription
subscription_id = "" # "your-subscription-id"

# Resource Group
resource_group_name = "RG-cdn-test"
location            = "eastus"

# CDN Configuration
cdn_profile_name     = "mycdnprofiletestbr"
cdn_sku              = "Standard_Microsoft"
cdn_endpoint_name    = "mycdnendpointtestbr"
origin_host          = "myorigintestbr.example.com"
tags = {
  Environment = "CDN"
  Owner       = "IT"
}