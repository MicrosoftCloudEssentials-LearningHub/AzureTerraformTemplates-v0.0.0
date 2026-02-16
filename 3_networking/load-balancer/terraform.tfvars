# terraform.tfvars
# This file provides default values for the variables defined in variables.tf.
# These values can be overridden by specifying different values during Terraform execution.

# Azure Subscription
subscription_id = ""

# Resource Group
resource_group_name = "your-resource-group-name"
location            = "eastus"

# Load Balancer Configuration
load_balancer_name             = "my-load-balancer"
public_ip_name                 = "my-lb-public-ip"
frontend_ip_configuration_name = "frontend-ip-config"
backend_pool_name              = "backend-pool"
health_probe_name              = "health-probe"
lb_rule_name                   = "lb-rule"
lb_sku                         = "Standard"
probe_protocol                 = "Tcp"
probe_port                     = 80
frontend_port                  = 80
backend_port                   = 80

# Tags
tags = {
  Environment = "Production"
  Project     = "MyProject"
  Owner       = "TeamName"
}
