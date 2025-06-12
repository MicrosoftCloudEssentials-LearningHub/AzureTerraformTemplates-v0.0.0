# Terraform Template - Azure Front Door

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-06-12

----------

> This template contains Terraform configurations to create and manage an Azure Front Door Standard/Premium profile, including frontend endpoint, backend pool, health probe, and routing rule.

> [!NOTE]
> This Front Door configuration uses best practices for global HTTP/HTTPS load balancing and health monitoring.

<p align="center">
    <img width="700" alt="image" src="https://github.com/user-attachments/assets/2571f8a5-a5d3-4785-9b50-71275a31ab77">
</p>

## File Descriptions

- **main.tf**: Contains the main configuration for creating the Azure Front Door profile and its associated resources.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs such as Front Door profile ID and frontend endpoint hostname.

## Variables

> Below is a list of variables used in this template, their expected values, types, and examples:

| Variable Name         | Description                                      | Type   | Example Value                |
|---------------------- |--------------------------------------------------|--------|-----------------------------|
| `subscription_id`     | The Azure subscription ID                        | string | `"00000000-0000-0000-0000-000000000000"` |
| `resource_group_name` | The name of the resource group                   | string | `"my-frontdoor-rg"`         |
| `location`            | The Azure region to deploy resources             | string | `"eastus"`                  |
| `front_door_name`     | The name of the Azure Front Door profile         | string | `"myfrontdoorprofile"`      |
| `backend_host`        | The backend host (FQDN or IP) for Front Door     | string | `"mybackend.example.com"`   |

## Usage

1. Clone the repository and navigate to the front-door directory.
2. Update the `terraform.tfvars` file with your values.
3. Initialize and apply the Terraform configuration:

```bash
terraform init
terraform plan
terraform apply
```

## Outputs

| Output Name                  | Description                                 |
|------------------------------|---------------------------------------------|
| `front_door_id`              | The ID of the Front Door profile            |
| `front_door_frontend_endpoint` | The frontend endpoint hostname of Front Door |

<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
