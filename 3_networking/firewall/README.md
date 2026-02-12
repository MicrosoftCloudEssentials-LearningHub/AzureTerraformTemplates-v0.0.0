# Terraform Template - Azure Firewall

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-09

----------

> This template contains Terraform configurations to create and manage an Azure Firewall, including a public IP and required subnet configuration.

> [!NOTE]
> The subnet used for Azure Firewall **must** be named `AzureFirewallSubnet` and sized at least /26.

<p align="center">
    <img width="800" alt="image" src="https://github.com/user-attachments/assets/7614ce31-c57d-41ce-a9f2-307c29cb0f3d">
</p>

## File Descriptions

- **main.tf**: Contains the main configuration for creating the Azure Firewall and its supporting resources.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs such as Firewall ID and public IP address.

## Variables

| Variable Name | Description | Type | Example Value |
| --- | --- | --- | --- |
| `resource_group_name` | The name of the resource group | string | `"my-firewall-rg"` |
| `location` | The Azure region to deploy resources | string | `"eastus"` |
| `firewall_name` | The name of the Azure Firewall | string | `"my-azfw"` |
| `public_ip_name` | The name of the public IP address for the firewall | string | `"my-azfw-pip"` |
| `subnet_id` | The ID of the subnet for the Azure Firewall | string | `".../subnets/AzureFirewallSubnet"` |

## Usage

1. Clone the repository and navigate to the firewall directory.
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
| `firewall_id` | The ID of the Azure Firewall |
| `firewall_public_ip` | The public IP address of the Azure Firewall |

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1790-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-12</p>
</div>
<!-- END BADGE -->
