# Terraform Template - MongoDB Atlas with Azure Network Peering

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-03-24

----------

> This template contains Terraform configurations to create and manage MongoDB Atlas with Azure network peering. Below is a description of the files and the variables used in this template.

> [!NOTE]
> The MongoDB Atlas network peering depends on the Azure resources. Terraform ensures that these resources are created before the peering by using the `depends_on` argument in the configuration.

<p align="center">
    <img width="550" alt="image" src="">

</p>

## Prerequisites

- An `Azure subscription is required`. All other resources, including instructions for creating a Resource Group, are provided in this workshop.
-` Contributor role assigned or any custom role that allows`: access to manage all resources, and the ability to deploy resources within subscription.
- If you choose to use the Terraform approach, please ensure that:
  -  [Terraform is installed on your local machine](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/install-cli#install-terraform).
  -  [Install the Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) to work with both Terraform and Azure commands.
- A MongoDB Atlas account. If you don't have one yet, just sign up for a [free MongoDB Atlas account here](https://www.mongodb.com/cloud/atlas/register).

> [!IMPORTANT]
> Please read [terraform documentation on azurerm specifics](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/network_peering). To create the peering request with an Azure VNET, you need to grant Atlas the following permissions on the virtual network: <br/>
> - Microsoft.Network/virtualNetworks/virtualNetworkPeerings/read <br/>
> - Microsoft.Network/virtualNetworks/virtualNetworkPeerings/write <br/>
> - Microsoft.Network/virtualNetworks/virtualNetworkPeerings/delete <br/>
> - Microsoft.Network/virtualNetworks/peer/action <br/>
> For more information, see [Set Up a Network Peering Connection](https://docs.atlas.mongodb.com/security-vpc-peering/) and [Mongo DB network peering](https://docs.atlas.mongodb.com/reference/api/vpc-create-peering-connection/)

## File Descriptions

- **main.tf**: Contains the main configuration for creating the MongoDB Atlas network peering and the Azure resources that it depends on.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the providers to interact with MongoDB Atlas and Azure resources.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs of the Terraform configuration, such as the peering connection details.

## Variables

Below is a list of variables used in this template, their expected values, types, and examples:

| Variable Name             | Description                                      | Type   | Example Value         |
|---------------------------|--------------------------------------------------|--------|-----------------------|
| `azure_subscription_id`   | The Azure subscription ID.                       | string | `"your-subscription-id"` |
| `resource_group_name`     | The name of the Azure resource group.            | string | `"your-resource-group"` |
| `vnet_name`               | The name of the Azure virtual network.           | string | `"your-vnet-name"`    |
| `atlas_cidr_block`        | The CIDR block for the Atlas network.            | string | `"10.0.0.0/24"`       |
| `location`                | The location/region where the resources will be created. | string | `"West US"`           |
| `mongodbatlas_org_id`     | The organization ID for MongoDB Atlas.           | string | `"your-org-id"`       |
| `azure_directory_id`      | The Azure directory ID.                          | string | `"your-directory-id"` |

<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
