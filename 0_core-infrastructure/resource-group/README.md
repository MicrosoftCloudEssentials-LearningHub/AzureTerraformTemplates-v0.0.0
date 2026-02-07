# Terraform Template - Azure Resource Group

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-03

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

| Variable Name | Description | Type | Example Value |
| --- | --- | --- | --- |
| `resource_group_name` | The name of the Azure Resource Group to create. | string | `"my-resource-group"` |
| `location` | The Azure region where the Resource Group will be created. | string | `"East US"` |
| `environment` | The environment for the Resource Group (e.g., dev, prod). | string | `"dev"` |
| `enable_logging` | Whether to enable logging for the Resource Group. | bool | `true` |
| `tags` | A map of tags to assign to the Resource Group. | map | `{ "env": "dev" }` |

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1615-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-07</p>
</div>
<!-- END BADGE -->
