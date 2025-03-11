# Terraform Template - Azure Resource Group

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-02-21

------------------------------------------

> This template contains Terraform configurations to create and manage an Azure Resource Group. Below is a description of the files and the variables used in this template.

## File Descriptions

- **main.tf**: Contains the main configuration for creating the Azure Resource Group.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the Azure provider to interact with Azure resources.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs of the Terraform configuration, such as the resource group name and location.

## Variables

Below is a list of variables used in this template, their expected values, types, and examples:

| Variable Name       | Description                                      | Type   | Example Value         |
|---------------------|--------------------------------------------------|--------|-----------------------|
| `resource_group_name` | The name of the Azure Resource Group to create. | string | `"my-resource-group"` |
| `location`          | The Azure region where the Resource Group will be created. | string | `"East US"`           |
| `environment`       | The environment for the Resource Group (e.g., dev, prod). | string | `"dev"`               |
| `enable_logging`    | Whether to enable logging for the Resource Group. | bool   | `true`                |
| `tags`              | A map of tags to assign to the Resource Group.   | map    | `{ "env": "dev" }`    |

<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
