# Terraform Template - MongoDB Atlas with Azure Network Peering

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-03

----------

> This template contains Terraform configurations to create and manage MongoDB Atlas with Azure network peering. Below is a description of the files and the variables used in this template.

> [!IMPORTANT]
> Please review the [list of deployment known errors](/1_storage-databases/mongo-atlas/known_errors.md) in case any guidance is needed.

<details>
<summary><b>List of References </b> (Click to expand)</summary>

- [AzureRM - MongoDB Atlas Provider](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs)
- [MongoDB - Set Up a Network Peering Connection](https://www.mongodb.com/docs/atlas/security-vpc-peering/)
- [MongoDB - Manage Identity Providers](https://www.mongodb.com/docs/atlas/security/manage-federated-auth/)
- [Resource: mongodbatlas_network_peering](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/network_peering)
- [MongoDB Atlas - Limits](https://www.mongodb.com/docs/atlas/reference/limitations/#std-label-limits)
- [Resource: azuread_service_principal](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal)
- [Resource: azuread_application](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application.html)
- [Resource: azuread_service_principal_password](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal_password)
- [Deploying MongoDB Atlas With Terraform with Azure](https://www.mongodb.com/developer/products/atlas/mongodb-atlas-deployment-with-terraform/?msockid=38ec3806873362243e122ce086486339)

</details>

> [!NOTE]
> The MongoDB Atlas network peering depends on the Azure resources. Terraform ensures that these resources are created before the peering by using the `depends_on` argument in the configuration.

<p align="center">
    <img width="550" alt="image" src="https://github.com/user-attachments/assets/2963fec6-0ec5-47b6-b203-a18b15a1d9a6">
</p>

<p align="center">
    <img width="550" alt="image" src="https://github.com/user-attachments/assets/be7ee535-f2c8-4c33-9fa2-a75025366097">
</p>

<p align="center">
    <img width="550" alt="image" src="https://github.com/user-attachments/assets/62f3c882-2ca5-4abf-9de0-fa83857ec03d">
</p>

<p align="center">
    <img width="550" alt="image" src="https://github.com/user-attachments/assets/de1d3b05-1596-4be0-8a35-73d472b17478">
</p>

> [!TIP]
> For this demostration, I used promotional codes that I found for MongoDB Atlas that will give you $100 FREE MONGODB credits: `GETATLAS`

## Prerequisites

- An `Azure subscription is required`. All other resources, including instructions for creating a Resource Group, are provided in this workshop.
- `Contributor role assigned or any custom role that allows`: access to manage all resources, and the ability to deploy resources within subscription.
- If you choose to use the Terraform approach, please ensure that:
  - [Terraform is installed on your local machine](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/install-cli#install-terraform).
  - [Install the Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) to work with both Terraform and Azure commands.
- A MongoDB Atlas account. If you don't have one yet, just sign up for a [free MongoDB Atlas account here](https://www.mongodb.com/cloud/atlas/register).

    <https://github.com/user-attachments/assets/1507a6a7-b74b-4ec6-8118-433ef52e6d8f>

## Permissions required 

> Please read [terraform documentation on azurerm specifics](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/network_peering). To create the peering request with an Azure VNET, you need to grant Atlas the following permissions on the virtual network: <br/>
>
> - Microsoft.Network/virtualNetworks/virtualNetworkPeerings/read <br/>
> - Microsoft.Network/virtualNetworks/virtualNetworkPeerings/write <br/>
> - Microsoft.Network/virtualNetworks/virtualNetworkPeerings/delete <br/>
> - Microsoft.Network/virtualNetworks/peer/action <br/>
>
> For more information, see [Set Up a Network Peering Connection](https://docs.atlas.mongodb.com/security-vpc-peering/) and [Mongo DB network peering](https://docs.atlas.mongodb.com/reference/api/vpc-create-peering-connection/)

> For example:

<https://github.com/user-attachments/assets/2f71a62f-1d8c-41f4-9403-efb84028056c>

## File Descriptions

- **main.tf**: Contains the main configuration for creating the MongoDB Atlas network peering and the Azure resources that it depends on.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the providers to interact with MongoDB Atlas and Azure resources.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs of the Terraform configuration, such as the peering connection details.

## Variables

Below is a list of variables used in this template, their expected values, types, and examples:

| Variable Name | Description | Type | Example Value |
| --- | --- | --- | --- |
| `azure_subscription_id` | The Azure subscription ID. | string | `"your-subscription-id"` |
| `resource_group_name` | The name of the Azure resource group. | string | `"your-resource-group"` |
| `vnet_name` | The name of the Azure virtual network. | string | `"your-vnet-name"` |
| `azure_vnet_cidr_block` | The CIDR block for the Azure virtual network. | string | `"10.1.0.0/16"` |
| `atlas_cidr_block` | The CIDR block for the MongoDB Atlas network container. | string | `"192.168.1.0/24"` |
| `location` | The location/region where the resources will be created. | string | `"West US"` |
| `mongodbatlas_org_id` | The organization ID for MongoDB Atlas. | string | `"your-org-id"` |
| `azure_directory_id` | The Azure directory ID. | string | `"your-directory-id"` |
| `mongodbatlas_public_key` | The public key for MongoDB Atlas. | string | `"your-public-key"` |
| `mongodbatlas_private_key` | The private key for MongoDB Atlas. | string | `"your-private-key"` |

> CIDR options example:

| Azure Virtual Network CIDR Block Options | MongoDB Atlas Network Container CIDR Block Options |
| --- | --- |
| `10.2.0.0/16` | `192.168.2.0/24` |
| `10.3.0.0/16` | `192.168.3.0/24` |
| `10.4.0.0/16` | `192.168.4.0/24` |
| `10.5.0.0/16` | `192.168.5.0/24` |
| `10.6.0.0/16` | `192.168.6.0/24` |

## How to create MongoDB Atlas public/private key

1. Go to `Access Manager`
2. Click on `Add new`

   <img width="550" alt="image" src="https://github.com/user-attachments/assets/a96f3604-2e9c-4a72-8984-747577f2114d">

3. Select API Key, click on create new, and store the values securely

   <img width="350" alt="image" src="https://github.com/user-attachments/assets/4e774329-6af5-4e76-a6f8-13d25c30be08">

    <https://github.com/user-attachments/assets/7c42f0c5-37cf-4d1b-9f48-ccf95d6c5f4d>

## How it works 

> Overall, to set up network peering between Azure and MongoDB Atlas using Terraform, start by creating a MongoDB Atlas account, project, network container, and cluster. Ensure you have an Azure virtual network (VNet) configured and [grant necessary permissions to the Azure service principal to enable it to peer with MongoDB Atlas](#permissions-required). Deploy the VNet peering module to establish the connection between the Azure VNet and MongoDB Atlas, making sure the CIDR blocks do not overlap to avoid conflicts. You can use this template, and run the stardard terraform commands to deploy the infrastrcture, click [here if you need more information about it](https://github.com/MicrosoftCloudEssentials-LearningHub/AzureTerraformTemplates-v0.0.0/tree/mongo-atlas?tab=readme-ov-file#how-to-execute-it) <br/>

<https://github.com/user-attachments/assets/95f0c5cd-b1b9-422d-a32d-4cfdb98a5a1e>

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1646-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-09</p>
</div>
<!-- END BADGE -->
