# Terraform Template - Azure File Storage

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-03

----------

> This template contains Terraform configurations to create and manage an Azure Storage Account and File Share with dependencies on a Resource Group. Below is a description of the files and the variables used in this template.

> [!NOTE]
> The File Share depends on the Storage Account and Resource Group. Terraform ensures that these resources are created before the File Share by using the `depends_on` argument in the configuration.

<p align="center">
    <img width="550" alt="image" src="https://github.com/user-attachments/assets/66b111e1-f84a-4135-8807-48fd9d7ce56e">
</p>

## File Descriptions

- **main.tf**: Contains the main configuration for creating the Azure Storage Account and File Share, and the Resource Group they depend on.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the Azure provider to interact with Azure resources.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs of the Terraform configuration, such as the Storage Account name, File Share name, and associated Resource Group.

## Variables

Below is a list of variables used in this template, their expected values, types, and examples:

| Variable Name | Description | Type | Example Value |
| --- | --- | --- | --- |
| `resource_group_name` | The name of the Azure Resource Group to associate the Storage Account and File Share with. | string | `"my-resource-group"` |
| `location` | The Azure region where the Resource Group will be created. | string | `"East US"` |
| `storage_account_name` | The name of the Azure Storage Account to create. | string | `"mystorageaccount"` |
| `account_tier` | The tier to use for the Storage Account (Standard or Premium). | string | `"Standard"` |
| `account_replication_type` | The replication type to use for the Storage Account (LRS, GRS, RAGRS, ZRS). | string | `"LRS"` |
| `share_name` | The name of the File Share to create. | string | `"myfileshare"` |
| `share_quota` | The quota for the File Share in GB. | number | `100` |
| `subscription_id` | The Azure subscription ID to use for the AzureRM provider. | string | `"your-subscription-id"` |
| `tags` | A map of tags to assign to the resources. | map | `{ "env": "dev" }` |

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1283-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-03</p>
</div>
<!-- END BADGE -->
