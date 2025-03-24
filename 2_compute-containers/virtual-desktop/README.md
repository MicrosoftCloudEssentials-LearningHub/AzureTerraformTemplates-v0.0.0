# Terraform Template - Azure Virtual Desktop

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-03-24

----------

> This template contains Terraform configurations to create and manage an Azure Virtual Desktop (AVD) environment with dependencies on a Resource Group, Virtual Network, and Subnet. Below is a description of the files and the variables used in this template.

> [!NOTE]
> The AVD environment depends on the Resource Group, Virtual Network, and Subnet. Terraform ensures that these resources are created before the AVD environment by using the `depends_on` argument in the configuration.

<p align="center">
    <img width="550" alt="image" src="">

</p>

## File Descriptions

- **main.tf**: Contains the main configuration for creating the Azure Virtual Desktop environment and the resources it depends on.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the Azure provider to interact with Azure resources.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs of the Terraform configuration, such as the AVD workspace name, host pool name, and associated Resource Group.

## Variables

Below is a list of variables used in this template, their expected values, types, and examples:

| Variable Name             | Description                                      | Type   | Example Value         |
|---------------------------|--------------------------------------------------|--------|-----------------------|
| `resource_group_name`     | The name of the Azure Resource Group to associate the AVD environment with. | string | `"my-resource-group"` |
| `location`                | The Azure region where the Resource Group will be created. | string | `"East US"`           |
| `virtual_network_name`    | The name of the Azure Virtual Network to create. | string | `"my-vnet"`           |
| `subnet_name`             | The name of the Subnet to create within the Virtual Network. | string | `"my-subnet"`         |
| `workspace_name`          | The name of the Azure Virtual Desktop Workspace to create. | string | `"my-avd-workspace"`  |
| `host_pool_name`          | The name of the Azure Virtual Desktop Host Pool to create. | string | `"my-avd-hostpool"`   |
| `vm_size`                 | The size of the Virtual Machines for the session hosts. | string | `"Standard_DS2_v2"`   |
| `admin_username`          | The administrator username for the session hosts. | string | `"adminuser"`         |
| `admin_password`          | The administrator password for the session hosts. | string | `"P@ssw0rd1234"`      |
| `tags`                    | A map of tags to assign to the resources.        | map    | `{ "env": "dev" }`    |

<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
