# Terraform Template - Azure Bastion Host

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-09

------------------------------------------

> This template contains Terraform configurations to create and manage an Azure Bastion Host with dependencies on a Resource Group, Virtual Network, Subnet, and Public IP. Below is a description of the files and the variables used in this template.

> [!NOTE]
> The Bastion Host depends on the Resource Group, Virtual Network, and Subnet. Terraform ensures that these resources are created before the Bastion Host by using the `depends_on` argument in the configuration.

<p align="center">
    <img width="550" alt="image" src="https://github.com/user-attachments/assets/7727a7d8-8ee4-4638-a2cc-65b1b430c57c">
</p>

## File Descriptions

- **main.tf**: Contains the main configuration for creating the Azure Bastion Host and its dependencies.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the Azure provider to interact with Azure resources.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs of the Terraform configuration, such as the Bastion Host name and associated Resource Group.

## Variables

Below is a list of variables used in this template, their expected values, types, and examples:

| Variable Name | Description | Type | Example Value |
| --- | --- | --- | --- |
| `resource_group_name` | The name of the Azure Resource Group to associate the Bastion Host with. | string | `"my-resource-group"` |
| `location` | The Azure region where the Resource Group will be created. | string | `"East US"` |
| `vnet_name` | The name of the Virtual Network. | string | `"my-vnet"` |
| `vnet_address_space` | The address space for the Virtual Network. | list(string) | `["10.0.0.0/16"]` |
| `subnet_name` | The name of the Subnet. | string | `"my-subnet"` |
| `subnet_address_prefixes` | The address prefixes for the Subnet. | list(string) | `["10.0.1.0/24"]` |
| `public_ip_name` | The name of the Public IP. | string | `"my-public-ip"` |
| `bastion_name` | The name of the Bastion Host. | string | `"my-bastion"` |
| `bastion_dns_name` | The DNS name for the Bastion Host. | string | `"my-bastion-dns"` |
| `tags` | A map of tags to assign to the resources. | map | `{ "env": "dev" }` |

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1646-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-09</p>
</div>
<!-- END BADGE -->
