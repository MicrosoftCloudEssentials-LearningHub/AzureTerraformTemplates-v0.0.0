# Terraform Template - Azure Application Gateway

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-09

----------

> This template contains Terraform configurations to create and manage an Azure Application Gateway with its associated components including public IP, backend pool, and request routing rules.

> [!NOTE]
> The Application Gateway configuration uses Standard_v2 SKU, providing enhanced features like autoscaling, zone redundancy, and Web Application Firewall.

<p align="center">
    <img width="550" alt="image" src="https://github.com/user-attachments/assets/d2f8a37d-f1bc-4da5-9fff-eb8e89905315">
</p>

## File Descriptions

- **main.tf**: Contains the main configuration for creating the Azure Application Gateway and its associated resources.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the Azure provider to interact with Azure resources.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs such as Application Gateway ID and public IP address.

## Variables

> Below is a list of variables used in this template, their expected values, types, and examples:

| Variable Name | Description | Type | Example Value |
| --- | --- | --- | --- |
| `subscription_id` | The Azure subscription ID | string | `"12345678-abcd-efgh-ijkl-9876543210"` |
| `resource_group_name` | The name of the resource group | string | `"appgw-resource-group"` |
| `location` | The Azure region to deploy resources | string | `"eastus"` |
| `public_ip_name` | The name of the public IP address | string | `"appgw-public-ip"` |
| `app_gateway_name` | The name of the Application Gateway | string | `"my-app-gateway"` |
| `vnet_name` | The name of the virtual network | string | `"appgw-vnet"` |
| `vnet_address_space` | The address space of the virtual network | list(string) | `["10.0.0.0/16"]` |
| `subnet_name` | The name of the subnet for the Application Gateway | string | `"appgw-subnet"` |
| `subnet_address_prefixes` | The address prefixes for the subnet | list(string) | `["10.0.1.0/24"]` |

## Usage

1. Clone the repository and navigate to the application gateway directory.
2. Update the `terraform.tfvars` file with your values.
3. Initialize and apply the Terraform configuration:

```bash
terraform init
terraform plan
terraform apply
```

## Outputs

| Output Name | Description |
| --- | --- |
| `application_gateway_id` | The ID of the Application Gateway |
| `public_ip_address` | The frontend public IP address of the Application Gateway |
| `virtual_network_name` | The name of the virtual network |
| `subnet_name` | The name of the subnet used by the Application Gateway |

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1706-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-10</p>
</div>
<!-- END BADGE -->
