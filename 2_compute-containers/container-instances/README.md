# Terraform Template - Azure Container Instances

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-03-24

----------

> This template contains Terraform configurations to create and manage Azure Container Instances with dependencies on a Resource Group. Below is a description of the files and the variables used in this template.

> [!NOTE]
> The Container Instances depend on the Resource Group. Terraform ensures that these resources are created before the Container Instances by using the `depends_on` argument in the configuration.

<p align="center">
    <img width="550" alt="image" src="https://github.com/user-attachments/assets/d7594589-5fdf-4758-b334-a71f0dc7c2e9">

</p>

## File Descriptions

- **main.tf**: Contains the main configuration for creating the Azure Container Instances and the resources it depends on.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the Azure provider to interact with Azure resources.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs of the Terraform configuration, such as the Container Instance name, IP address, and associated Resource Group.

## Variables

Below is a list of variables used in this template, their expected values, types, and examples:

| Variable Name             | Description                                      | Type   | Example Value         |
|---------------------------|--------------------------------------------------|--------|-----------------------|
| `resource_group_name`     | The name of the Azure Resource Group to associate the Container Instances with. | string | `"my-resource-group"` |
| `location`                | The Azure region where the Resource Group will be created. | string | `"East US"`           |
| `container_group_name`    | The name of the Azure Container Group to create. | string | `"my-container-group"` |
| `container_name`          | The name of the Container to create within the Container Group. | string | `"my-container"`      |
| `image`                   | The Docker image to use for the Container.       | string | `"nginx:latest"`      |
| `cpu_cores`               | The number of CPU cores to allocate to the Container. | number | `1`                   |
| `memory_in_gb`            | The amount of memory in GB to allocate to the Container. | number | `1.5`                 |
| `port`                    | The port to expose on the Container.             | number | `80`                  |
| `tags`                    | A map of tags to assign to the resources.        | map    | `{ "env": "dev" }`    |

<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
