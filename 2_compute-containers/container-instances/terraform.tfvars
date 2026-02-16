resource_group_name  = "my-resource-group"
location             = "East US 2"
container_group_name = "my-container-group"
container_name       = "my-container"
image                = "nginx:latest"
cpu_cores            = 1
memory_in_gb         = 1.5
port                 = 80
subscription_id      = "your-subscription-id"
tags = {
  env = "dev"
}
