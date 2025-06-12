# Terraform Template - Azure ExpressRoute

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-06-11

----------

> This template contains Terraform configurations to create and manage an Azure ExpressRoute circuit, including provider, peering location, and bandwidth settings.

> [!NOTE]
> ExpressRoute circuits require coordination with your chosen service provider.

<p align="center">
    <img width="700" alt="image" src="https://github.com/user-attachments/assets/7001446c-e5cc-4a16-b443-5a5689f31f68">
</p>

## File Descriptions

- **main.tf**: Contains the main configuration for creating the Azure ExpressRoute circuit.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs such as ExpressRoute circuit ID and service key.

## Variables

| Variable Name           | Description                                      | Type   | Example Value                |
|------------------------ |--------------------------------------------------|--------|-----------------------------|
| `subscription_id`       | The Azure subscription ID                        | string | `"00000000-0000-0000-0000-000000000000"` |
| `resource_group_name`   | The name of the resource group                   | string | `"my-expressroute-rg"`      |
| `location`              | The Azure region to deploy resources             | string | `"eastus"`                  |
| `expressroute_name`     | The name of the ExpressRoute circuit             | string | `"my-expressroute"`         |
| `service_provider_name` | The name of the ExpressRoute service provider    | string | `"Equinix"`                 |
| `peering_location`      | The peering location for the ExpressRoute circuit| string | `"Silicon Valley"`          |
| `bandwidth_in_mbps`     | The bandwidth in Mbps for the circuit            | number | `200`                       |
| `sku_tier`              | The SKU tier for ExpressRoute                    | string | `"Standard"`                |
| `sku_family`            | The SKU family for ExpressRoute                  | string | `"MeteredData"`             |

## Usage

1. Clone the repository and navigate to the expressroute directory.
2. Update the `terraform.tfvars` file with your values.
3. Initialize and apply the Terraform configuration:

```bash
terraform init
terraform plan
terraform apply
```

## Outputs

| Output Name                | Description                                 |
|----------------------------|---------------------------------------------|
| `expressroute_id`          | The ID of the ExpressRoute circuit          |
| `expressroute_service_key` | The service key of the ExpressRoute circuit |

<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
