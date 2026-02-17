# Terraform Template - Azure Traffic Manager

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-09

----------

> This template contains Terraform configurations to create and manage an Azure Traffic Manager profile, including DNS configuration and endpoint monitoring.

> [!NOTE]
> This Traffic Manager configuration uses best practices for routing, monitoring, and DNS setup.

<p align="center">
    <img width="550" alt="image" src="https://github.com/user-attachments/assets/32680750-b3c9-4149-b0a9-677bcaccffca">
</p>

## File Descriptions

- **main.tf**: Contains the main configuration for creating the Azure Traffic Manager profile and its associated resources.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the Azure provider to interact with Azure resources.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs such as Traffic Manager profile ID and FQDN.

## Variables

Below is a list of variables used in this template, their expected values, types, and examples:

| Variable Name | Description | Type | Example Value |
| --- | --- | --- | --- |
| `resource_group_name` | The name of the resource group | string | `"tm-resource-group"` |
| `location` | The Azure region for the resource group | string | `"eastus"` |
| `traffic_manager_name` | The name of the Traffic Manager profile | string | `"my-tm-profile"` |
| `traffic_routing_method` | The traffic routing method (Performance, Priority, etc.) | string | `"Performance"` |
| `dns_name` | The relative DNS name for the Traffic Manager profile | string | `"mytmprofile"` |
| `ttl` | The DNS Time-To-Live (TTL) in seconds | number | `30` |
| `monitor_protocol` | The protocol used for endpoint monitoring | string | `"HTTP"` |
| `monitor_port` | The port used for endpoint monitoring | number | `80` |
| `monitor_path` | The path used for endpoint monitoring | string | `"/"` |

## Usage

1. Clone the repository and navigate to the traffic-manager directory.
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
| `traffic_manager_profile_id` | The ID of the Traffic Manager profile |
| `traffic_manager_fqdn` | The FQDN of the Traffic Manager profile |

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1930-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-17</p>
</div>
<!-- END BADGE -->
