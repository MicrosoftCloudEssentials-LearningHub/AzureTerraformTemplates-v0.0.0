# Terraform Template - Azure Functions (Function App)

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-09

----------

> This template contains Terraform configurations to create and manage Azure Functions with dependencies on a Resource Group, Storage Account, and App Service Plan. Below is a description of the files and the variables used in this template.

> [!NOTE]
> The Azure Functions depend on the Resource Group, Storage Account, and App Service Plan. Terraform ensures that these resources are created before the Azure Functions by using the `depends_on` argument in the configuration.

<p align="center">
    <img width="550" alt="image" src="https://github.com/user-attachments/assets/f1b6b070-f241-4aa4-9c3f-253bc3d336f2">

</p>

## File Descriptions

- **main.tf**: Contains the main configuration for creating the Azure Functions and the resources it depends on.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the Azure provider to interact with Azure resources.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs of the Terraform configuration, such as the Function App name, URL, and associated Resource Group.

## Variables

Below is a list of variables used in this template, their expected values, types, and examples:

| Variable Name | Description | Type | Example Value |
| --- | --- | --- | --- |
| `resource_group_name` | The name of the Azure Resource Group to associate the Function App with. | string | `"my-resource-group"` |
| `location` | The Azure region where the Resource Group will be created. | string | `"East US"` |
| `storage_account_name` | The name of the Azure Storage Account to create. | string | `"mystorageaccount"` |
| `app_service_plan_name` | The name of the Azure App Service Plan to create. | string | `"my-app-service-plan"` |
| `function_app_name` | The name of the Azure Function App to create. | string | `"my-function-app"` |
| `runtime_stack` | The runtime stack for the Function App. | string | `"NODE\|14-lts"` |
| `tags` | A map of tags to assign to the resources. | map | `{ "env": "dev" }` |

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1857-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-16</p>
</div>
<!-- END BADGE -->
