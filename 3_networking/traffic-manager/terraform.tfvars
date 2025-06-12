# terraform.tfvars
# This file provides default values for the variables defined in variables.tf.
# These values can be overridden by specifying different values during Terraform execution.

# Azure Subscription
subscription_id = "407f4106-0fd3-42e0-9348-3686dd1e7347" # your-subscription-id

# Resource Group
resource_group_name = "RG-trafficmanager-test"  # your-resource-group-name
location = "eastus"

# Traffic Manager Configuration
traffic_manager_name   = "my-tm-profile"
traffic_routing_method = "Performance"
dns_name               = "mytmprofilebrowntest"
ttl                    = 30
monitor_protocol       = "HTTP"
monitor_port           = 80
monitor_path           = "/"
