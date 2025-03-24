resource_group_name     = "my-resource-groupx3"
location                = "East US 2"
virtual_network_name    = "my-vnet"
subnet_name             = "my-subnet"
aks_cluster_name        = "my-aks-cluster"
kubernetes_version      = "1.32"
node_count              = 3
node_vm_size            = "Standard_DS2_v2"
subscription_id       =  "your-subscription_id"
tags                    = {
  env = "dev"
}
