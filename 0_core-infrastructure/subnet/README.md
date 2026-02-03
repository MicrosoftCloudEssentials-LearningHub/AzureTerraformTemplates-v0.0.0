# Terraform Template - Azure Subnet

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-03

------------------------------------------

> This template contains Terraform configurations to create and manage an Azure Subnet with dependencies on a Virtual Network and Resource Group. Below is a description of the files and the variables used in this template.

> [!NOTE]
> The Subnet depends on the Virtual Network and Resource Group. Terraform ensures that the Resource Group and Virtual Network are created before the Subnet by using the `depends_on` argument in the configuration.

<p align="center">
    <img width="550" alt="image" src="https://github.com/user-attachments/assets/a17ef1ee-c54f-4702-8062-96ba53fee48e">
</p>

## File Descriptions

- **main.tf**: Contains the main configuration for creating the Azure Subnet, Virtual Network, and Resource Group.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the Azure provider to interact with Azure resources.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs of the Terraform configuration, such as the subnet name, address prefixes, and associated resources.

## Variables

Below is a list of variables used in this template, their expected values, types, and examples:

| Variable Name           | Description                                      | Type   | Example Value         |
| --- | --- | --- | --- |
| `resource_group_name` | The name of the Azure Resource Group to associate the Subnet with. | string | `"my-resource-group"` |
| `vnet_name` | The name of the Azure Virtual Network to associate the Subnet with. | string | `"my-vnet"` |
| `subnet_name` | The name of the Azure Subnet to create. | string | `"my-subnet"` |
| `location` | The Azure region where the Subnet will be created. | string | `"East US"` |
| `address_space` | The address space for the Virtual Network. | list | `["10.0.0.0/16"]` |
| `subnet_address_prefixes` | The address prefixes for the Subnet. | list | `["10.0.1.0/24"]` |
| `subscription_id` | The Azure subscription ID to use for the AzureRM provider. | string | `"your-subscription-id"` |
| `tags` | A map of tags to assign to the resources. | map | `{ "env": "dev" }` |

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1283-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-03</p>
</div>
<!-- END BADGE -->

