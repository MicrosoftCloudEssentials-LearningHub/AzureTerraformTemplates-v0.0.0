# Terraform Template - Azure Load Balancer

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-06-12

----------

> This template contains Terraform configurations to create and manage an Azure Load Balancer with its associated components including public IP, backend pool, health probe, and load balancing rules.

> [!NOTE]
> The Load Balancer configuration uses Standard SKU which provides enhanced features and scalability compared to Basic SKU.

<p align="center">
    <img width="750" alt="image" src="https://github.com/user-attachments/assets/b4f46023-3b27-4ff3-a637-dfc9deedf4aa">
</p>

## File Descriptions

- **main.tf**: Contains the main configuration for creating the Azure Load Balancer and its associated resources.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the Azure provider to interact with Azure resources.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs such as Load Balancer ID and public IP address.

## Variables

Below is a list of variables used in this template, their expected values, types, and examples:

| Variable Name | Description | Type | Example Value |
|--------------|-------------|------|---------------|
| `subscription_id` | The Azure subscription ID | string | `"your-subscription-id"` |
| `resource_group_name` | The name of the resource group | string | `"my-resource-group"` |
| `location` | The Azure region to deploy resources | string | `"eastus"` |
| `load_balancer_name` | The name of the load balancer | string | `"my-load-balancer"` |
| `public_ip_name` | The name of the public IP address | string | `"my-lb-public-ip"` |
| `frontend_ip_configuration_name` | Name of the frontend IP configuration | string | `"frontend-ip-config"` |
| `backend_pool_name` | Name of the backend address pool | string | `"backend-pool"` |
| `health_probe_name` | Name of the health probe | string | `"health-probe"` |
| `lb_rule_name` | Name of the load balancer rule | string | `"lb-rule"` |
| `lb_sku` | SKU of the load balancer | string | `"Standard"` |
| `probe_protocol` | Protocol for health probe | string | `"Tcp"` |
| `probe_port` | Port for health probe | number | `80` |
| `frontend_port` | Frontend port for load balancer rule | number | `80` |
| `backend_port` | Backend port for load balancer rule | number | `80` |
| `tags` | Tags to apply to all resources | map | `{ "Environment": "Production" }` |

## Usage

1. Clone the repository and navigate to the load balancer directory
2. Update the `terraform.tfvars` file with your values
3. Initialize and apply the Terraform configuration:

```bash
terraform init
terraform plan
terraform apply
```

## Outputs

| Output Name | Description |
|-------------|-------------|
| `load_balancer_id` | The ID of the Load Balancer |
| `public_ip_address` | The public IP address of the Load Balancer |
| `backend_pool_id` | The ID of the Backend Address Pool |
| `frontend_ip_configuration_id` | The ID of the Frontend IP Configuration |

<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
