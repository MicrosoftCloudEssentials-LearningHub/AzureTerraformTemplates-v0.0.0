# Terraform Template - Azure App Service

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-03-24

------------------------------------------

> This template contains Terraform configurations to create and manage an Azure App Service with dependencies on a Resource Group and App Service Plan. Below is a description of the files and the variables used in this template.

> [!NOTE]
> The App Service depends on the Resource Group and App Service Plan. Terraform ensures that these resources are created before the App Service by using the `depends_on` argument in the configuration.

<p align="center">
    <img width="550" alt="image" src="">

</p>

## File Descriptions

- **main.tf**: Contains the main configuration for creating the Azure App Service and the resources it depends on.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the Azure provider to interact with Azure resources.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs of the Terraform configuration, such as the App Service name, URL, and associated Resource Group.

## Variables

Below is a list of variables used in this template, their expected values, types, and examples:

| Variable Name             | Description                                      | Type   | Example Value         |
|---------------------------|--------------------------------------------------|--------|-----------------------|
| `resource_group_name`     | The name of the Azure Resource Group to associate the App Service with. | string | `"my-resource-group"` |
| `location`                | The Azure region where the Resource Group will be created. | string | `"East US"`           |
| `app_service_plan_name`   | The name of the Azure App Service Plan to create. | string | `"my-app-service-plan"` |
| `app_service_name`        | The name of the Azure App Service to create.     | string | `"my-app-service"`    |
| `app_service_sku`         | The SKU of the App Service Plan.                 | string | `"B1"`                |
| `runtime_stack`           | The runtime stack for the App Service.           | string | `"NODE|14-lts"`       |
| `tags`                    | A map of tags to assign to the resources.        | map    | `{ "env": "dev" }`    |

<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
