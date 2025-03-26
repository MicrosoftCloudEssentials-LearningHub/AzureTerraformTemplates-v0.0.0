# Main configuration file for defining MongoDB Atlas network peering and Azure resources

# Notes:
# - Use the `azurerm_resource_group` resource to create a resource group in Azure. 
# This is a container that holds related resources for an Azure solution.
# - Use the `azurerm_virtual_network` resource to create a virtual network in Azure. 
# This network will be used for the peering connection with MongoDB Atlas.
# - Use the `mongodbatlas_project` resource to create a project in MongoDB Atlas. 
# A project is a logical grouping of clusters, users, and other resources.
# - Use the `mongodbatlas_network_container` resource to define the CIDR block 
# and provider details for the peering connection. This container holds the 
# network settings for the peering connection.
# - Use the `mongodbatlas_network_peering` resource to create 
# the peering connection request with Azure VNET. This resource 
# establishes the network peering between MongoDB Atlas and Azure.
# - The `mongodbatlas_advanced_cluster` resource is optional and can be used
# to create a MongoDB Atlas cluster once the peering connection is established. 
# This resource defines the cluster configuration, including replication specs 
# and backup settings.

#----------------------------------------------------------------
# Create the Azure Resource Group
#----------------------------------------------------------------
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

#----------------------------------------------------------------
# Create the Azure Virtual Network
#----------------------------------------------------------------
resource "azurerm_virtual_network" "example" {
  name                = var.vnet_name
  address_space       = [var.atlas_cidr_block]
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name
}

#----------------------------------------------------------------
# Create the MongoDB Atlas Project
#----------------------------------------------------------------
resource "mongodbatlas_project" "example" {
  name = "Terraform Project"
  org_id = var.mongodbatlas_org_id
}

#----------------------------------------------------------------
# Create the MongoDB Atlas Network Container
# Container example provided but not always required,
# see network_container documentation for details.
#----------------------------------------------------------------
resource "mongodbatlas_network_container" "example" {
  project_id       = mongodbatlas_project.example.id
  atlas_cidr_block = var.atlas_cidr_block
  provider_name    = "AZURE"
  region           = "US_EAST_2"
}

#----------------------------------------------------------------
# Create the MongoDB Atlas Network Peering
# To create the peering request with an Azure VNET, you must grant Atlas the following permissions on the virtual network:
# - Microsoft.Network/virtualNetworks/virtualNetworkPeerings/read
# - Microsoft.Network/virtualNetworks/virtualNetworkPeerings/write
# - Microsoft.Network/virtualNetworks/virtualNetworkPeerings/delete
# - Microsoft.Network/virtualNetworks/peer/action
# Ensure you have created the required Azure service principal first.
# For more information, see:
# - https://docs.atlas.mongodb.com/security-vpc-peering/
# - https://docs.atlas.mongodb.com/reference/api/vpc-create-peering-connection/
#----------------------------------------------------------------
resource "mongodbatlas_network_peering" "azure_mongodb" {
  project_id            = mongodbatlas_project.example.id
  container_id          = mongodbatlas_network_container.example.id
  provider_name         = "AZURE"
  azure_directory_id    = var.azure_directory_id
  azure_subscription_id = var.azure_subscription_id
  resource_group_name   = var.resource_group_name
  vnet_name             = var.vnet_name

  depends_on = [
    azurerm_resource_group.example,
    azurerm_virtual_network.example
  ]
}

#----------------------------------------------------------------
# Create the MongoDB Atlas Cluster (Optional)
# Create the cluster once the peering connection is completed.
# Use this resource if you need to create a MongoDB Atlas cluster.
#----------------------------------------------------------------
resource "mongodbatlas_advanced_cluster" "test" {
  project_id     = mongodbatlas_project.example.id
  name           = "terraform-manually-test"
  cluster_type   = "REPLICASET"
  backup_enabled = true

  replication_specs {
    region_configs {
      priority      = 7
      provider_name = "AZURE"
      region_name   = "US_EAST_2"
      electable_specs {
        instance_size = "M10"
        node_count    = 3
      }
    }
  }

  depends_on = [mongodbatlas_network_peering.azure_mongodb]
}

