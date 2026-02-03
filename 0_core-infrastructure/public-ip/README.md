# Terraform Template - Azure Public IP

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-02-21

------------------------------------------

> This template contains Terraform configurations to create and manage an Azure Public IP with dependencies on a Resource Group. Below is a description of the files and the variables used in this template.

> [!NOTE]
> The Public IP depends on the Resource Group. Terraform ensures that the Resource Group is created before the Public IP by using the `depends_on` argument in the configuration.

<p align="center">
    <img width="550" alt="image" src="https://github.com/user-attachments/assets/679faa55-7a64-436e-b97f-984f276d0bad">
</p>

## File Descriptions

- **main.tf**: Contains the main configuration for creating the Azure Public IP and the Resource Group it depends on.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the Azure provider to interact with Azure resources.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs of the Terraform configuration, such as the Public IP name and address.

## Variables

Below is a list of variables used in this template, their expected values, types, and examples:

| Variable Name         | Description                                      | Type   | Example Value         |
|-----------------------|--------------------------------------------------|--------|-----------------------|
| `resource_group_name` | The name of the Azure Resource Group to associate the Public IP with. | string | `"my-resource-group"` |
| `public_ip_name`      | The name of the Azure Public IP to create.       | string | `"my-public-ip"`      |
| `location`            | The Azure region where the Public IP will be created. | string | `"East US"`           |
| `allocation_method`   | The allocation method for the Public IP (Static or Dynamic). | string | `"Static"`            |
| `sku`                 | The SKU of the Public IP (Basic or Standard).    | string | `"Basic"`             |
| `subscription_id`     | The Azure subscription ID to use for the AzureRM provider. | string | `"your-subscription-id"` |
| `tags`                | A map of tags to assign to the resources.        | map    | `{ "env": "dev" }`    |

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-3-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-03</p>
</div>
<!-- END BADGE -->

