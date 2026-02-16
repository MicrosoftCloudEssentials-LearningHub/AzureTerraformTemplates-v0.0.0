# Terraform Template - Azure Data Lake Storage Gen2

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-09

----------

> This template contains Terraform configurations to create and manage an Azure Data Lake Storage Gen2 with dependencies on a Resource Group and Storage Account. Below is a description of the files and the variables used in this template.

> [!NOTE]
> The Data Lake Gen2 File System depends on the Storage Account and Resource Group. Terraform ensures that these resources are created before the Data Lake Gen2 File System by using the `depends_on` argument in the configuration.

<p align="center">
    <img width="550" alt="image" src="https://github.com/user-attachments/assets/208e7e31-040d-4e9a-89e1-98fdcb0a9204">

</p>

## File Descriptions

- **main.tf**: Contains the main configuration for creating the Azure Data Lake Storage Gen2 and the Resource Group and Storage Account it depends on.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the Azure provider to interact with Azure resources.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs of the Terraform configuration, such as the Storage Account name, Data Lake Gen2 File System name, and associated Resource Group.

## Variables

Below is a list of variables used in this template, their expected values, types, and examples:

| Variable Name | Description | Type | Example Value |
| --- | --- | --- | --- |
| `resource_group_name` | The name of the Azure Resource Group to associate the Data Lake Storage Gen2 with. | string | `"my-resource-group"` |
| `location` | The Azure region where the Resource Group will be created. | string | `"East US"` |
| `storage_account_name` | The name of the Azure Storage Account to create. | string | `"mystorageaccount"` |
| `filesystem_name` | The name of the Data Lake Gen2 File System to create. | string | `"myfilesystem"` |
| `subscription_id` | The Azure subscription ID to use for the AzureRM provider. | string | `"your-subscription-id"` |
| `tags` | A map of tags to assign to the resources. | map | `{ "env": "dev" }` |

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1857-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-16</p>
</div>
<!-- END BADGE -->
