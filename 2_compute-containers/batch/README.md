# Terraform Template - Azure Batch

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-06-01

----------

> This template contains Terraform configurations to create and manage an Azure Batch environment with dependencies on a Resource Group and Storage Account. Below is a description of the files and the variables used in this template.

> [!NOTE]
> The Azure Batch environment depends on the Resource Group and Storage Account. Terraform ensures that these resources are created before the Batch environment by using the `depends_on` argument in the configuration.

<p align="center">
    <img width="700" alt="image" src="https://github.com/user-attachments/assets/f3079753-80f4-405e-9791-380050e5121a">
</p>

## File Descriptions

- **main.tf**: Contains the main configuration for creating the Azure Batch environment and the resources it depends on.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the Azure provider to interact with Azure resources.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs of the Terraform configuration, such as the Batch account name, pool names, and associated Resource Group.

## Variables

Below is a list of variables used in this template, their expected values, types, and examples:

| Variable Name             | Description                                      | Type   | Example Value         |
|---------------------------|--------------------------------------------------|--------|-----------------------|
| `resource_group_name`     | The name of the Azure Resource Group to associate the Batch environment with. | string | `"my-resource-group"` |
| `location`                | The Azure region where the Resource Group will be created. | string | `"East US"`           |
| `storage_account_name`    | The name of the Azure Storage Account to create. | string | `"mystorageaccount"`  |
| `batch_account_name`      | The name of the Azure Batch Account to create.   | string | `"mybatchaccount"`    |
| `tags`                    | A map of tags to assign to the resources.        | map    | `{ "env": "dev" }`    |

<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
