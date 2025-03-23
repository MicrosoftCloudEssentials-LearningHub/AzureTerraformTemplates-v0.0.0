# Terraform Template - Azure Virtual Machine

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-03-23

----------

> This template contains Terraform configurations to create and manage an Azure Virtual Machine with dependencies on a Resource Group, Virtual Network, and Subnet. Below is a description of the files and the variables used in this template.

> [!NOTE]
> The Virtual Machine depends on the Resource Group, Virtual Network, and Subnet. Terraform ensures that these resources are created before the Virtual Machine by using the `depends_on` argument in the configuration.

<p align="center">
    <img width="550" alt="image" src="">

</p>

## File Descriptions

- **main.tf**: Contains the main configuration for creating the Azure Virtual Machine and the resources it depends on.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the Azure provider to interact with Azure resources.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs of the Terraform configuration, such as the Virtual Machine name, IP address, and associated Resource Group.

## Variables
Below is a list of variables used in this template, their expected values, types, and examples:

| Variable Name             | Description                                      | Type   | Example Value         |
|---------------------------|--------------------------------------------------|--------|-----------------------|
| `resource_group_name`     | The name of the Azure Resource Group to associate the Virtual Machine with. | string | `"my-resource-group"` |
| `location`                | The Azure region where the Resource Group will be created. | string | `"East US"`           |
| `virtual_network_name`    | The name of the Azure Virtual Network to create. | string | `"my-vnet"`           |
| `subnet_name`             | The name of the Subnet to create within the Virtual Network. | string | `"my-subnet"`         |
| `vm_name`                 | The name of the Virtual Machine to create.       | string | `"my-vm"`             |
| `vm_size`                 | The size of the Virtual Machine.                 | string | `"Standard_DS1_v2"`   |
| `admin_username`          | The administrator username for the Virtual Machine. | string | `"adminuser"`         |
| `admin_password`          | The administrator password for the Virtual Machine. | string | `"P@ssw0rd1234"`      |
| `tags`                    | A map of tags to assign to the resources.        | map    | `{ "env": "dev" }`    |

<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
