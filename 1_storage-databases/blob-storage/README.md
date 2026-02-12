# Terraform Template - Azure Blob Storage

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-09

----------

> This template contains Terraform configurations to create and manage an Azure Storage Account and Blob Container with dependencies on a Resource Group. Below is a description of the files and the variables used in this template.

> [!NOTE]
> The Blob Container depends on the Storage Account and Resource Group. Terraform ensures that these resources are created before the Blob Container by using the `depends_on` argument in the configuration.

<p align="center">
    <img width="550" alt="image" src="https://github.com/user-attachments/assets/cd346b32-a7af-46e6-ba7d-b6886eb334a4">

</p>

## File Descriptions

- **main.tf**: Contains the main configuration for creating the Azure Storage Account and Blob Container, and the Resource Group they depend on.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the Azure provider to interact with Azure resources.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs of the Terraform configuration, such as the Storage Account name, Blob Container name, and associated Resource Group.

## Variables

Below is a list of variables used in this template, their expected values, types, and examples:

| Variable Name | Description | Type | Example Value |
| --- | --- | --- | --- |
| `resource_group_name` | The name of the Azure Resource Group to associate the Storage Account and Blob Container with. | string | `"my-resource-group"` |
| `location` | The Azure region where the Resource Group will be created. | string | `"East US"` |
| `storage_account_name` | The name of the Azure Storage Account to create. | string | `"mystorageaccount"` |
| `account_tier` | The tier to use for the Storage Account (Standard or Premium). | string | `"Standard"` |
| `account_replication_type` | The replication type to use for the Storage Account (LRS, GRS, RAGRS, ZRS). | string | `"LRS"` |
| `container_name` | The name of the Blob Container to create. | string | `"mycontainer"` |
| `container_access_type` | The access type for the Blob Container (private, blob, container). | string | `"private"` |
| `subscription_id` | The Azure subscription ID to use for the AzureRM provider. | string | `"your-subscription-id"` |
| `tags` | A map of tags to assign to the resources. | map | `{ "env": "dev" }` |

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1790-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-12</p>
</div>
<!-- END BADGE -->
