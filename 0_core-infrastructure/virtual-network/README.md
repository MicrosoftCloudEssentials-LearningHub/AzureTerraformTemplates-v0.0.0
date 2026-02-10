# Terraform Template - Azure Virtual Network

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-09

------------------------------------------

> This template contains Terraform configurations to create and manage an Azure Virtual Network with a dependency on an Azure Resource Group. Below is a description of the files and the variables used in this template.

> [!NOTE]
> The Virtual Network depends on the Resource Group. Terraform ensures that the Resource Group is created before the Virtual Network by using the `depends_on` argument in the configuration.

<p align="center">
    <img width="550" alt="image" src="https://github.com/user-attachments/assets/4d8d236c-28d7-4f87-b594-00f5988ecaa0">
</p>

## File Descriptions

- **main.tf**: Contains the main configuration for creating the Azure Virtual Network and the Resource Group it depends on.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the Azure provider to interact with Azure resources.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs of the Terraform configuration, such as the virtual network name, address space, and resource group name.

## Variables

Below is a list of variables used in this template, their expected values, types, and examples:

| Variable Name | Description | Type | Example Value |
| --- | --- | --- | --- |
| `vnet_name` | The name of the Azure Virtual Network to create. | string | `"my-vnet"` |
| `resource_group_name` | The name of the Azure Resource Group to associate the Virtual Network with. | string | `"my-resource-group"` |
| `location` | The Azure region where the Virtual Network will be created. | string | `"East US"` |
| `address_space` | The address space for the Virtual Network. | list | `["10.0.0.0/16"]` |
| `subscription_id` | The Azure subscription ID to use for the AzureRM provider. | string | `"your-subscription-id"` |
| `tags` | A map of tags to assign to the Virtual Network. | map | `{ "env": "dev" }` |

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1646-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-10</p>
</div>
<!-- END BADGE -->
