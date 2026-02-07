# Terraform Template - Azure VPN Gateway

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-03

----------

> This template contains Terraform configurations to create and manage an Azure VPN Gateway, including a virtual network, GatewaySubnet, and public IP.

> [!NOTE]
> The subnet used for Azure VPN Gateway **must** be named `GatewaySubnet` and sized at least /27.

<p align="center">
    <img width="700" alt="image" src="https://github.com/user-attachments/assets/c87943f7-5550-4e59-8059-3c236ec00f53">
</p>

## File Descriptions

- **main.tf**: Contains the main configuration for creating the Azure VPN Gateway and its supporting resources.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs such as VPN Gateway ID and public IP address.

## Variables

| Variable Name | Description | Type | Example Value |
| --- | --- | --- | --- |
| `subscription_id` | The Azure subscription ID | string | `"00000000-0000-0000-0000-000000000000"` |
| `resource_group_name` | The name of the resource group | string | `"my-vpngw-rg"` |
| `location` | The Azure region to deploy resources | string | `"eastus"` |
| `public_ip_name` | The name of the public IP address for the VPN Gateway | string | `"my-vpngw-pip"` |
| `vpn_gateway_name` | The name of the VPN Gateway | string | `"my-vpngw"` |
| `vpn_gateway_sku` | The SKU for the VPN Gateway | string | `"VpnGw1"` |

## Usage

1. Clone the repository and navigate to the vpn-gateway directory.
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
| `vpn_gateway_id` | The ID of the VPN Gateway |
| `vpn_gateway_public_ip` | The public IP address of the VPN Gateway |

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1615-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-07</p>
</div>
<!-- END BADGE -->
