# terraform.tfvars
# This file provides default values for the variables defined in variables.tf.
# These values can be overridden by specifying different values during Terraform execution.

# Azure Subscription
subscription_id = "" # your-subscription-id

# Resource Group
resource_group_name = "RG-frontdoor-test"
location            = "eastus"

# Front Door Configuration
front_door_name     = "myfrontdoorprofilebrown"
backend_host        = "mybackendtestbrown.example.com"

# Frontend Endpoint Configuration
frontend_endpoint_name = "frontendEndpoint"

# Health Probe Configuration
health_probe_path     = "/"
health_probe_protocol = "Http"

# Routing Rule Configuration
routing_rule_name    = "routingRule1"
accepted_protocols   = ["Http", "Https"]
patterns_to_match    = ["/*"]
