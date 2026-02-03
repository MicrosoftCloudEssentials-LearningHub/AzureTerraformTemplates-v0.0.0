# Terraform Template - Azure CDN (Content Delivery Network)

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-03

----------

> This template contains Terraform configurations to create and manage an Azure CDN profile and endpoint.

<p align="center">
    <img width="700" alt="image" src="https://github.com/user-attachments/assets/57af5973-c81e-48df-98d9-80957e0f7207">
</p>

## File Descriptions

- **main.tf**: Contains the main configuration for creating the Azure CDN profile and endpoint.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs such as CDN profile ID and endpoint host name.

## Variables

| Variable Name         | Description                                      | Type   | Example Value                |
|---------------------- |--------------------------------------------------|--------|-----------------------------|
| `subscription_id`     | The Azure subscription ID                        | string | `"00000000-0000-0000-0000-000000000000"` |
| `resource_group_name` | The name of the resource group                   | string | `"RG-cdn-test"`             |
| `location`            | The Azure region to deploy resources             | string | `"eastus"`                  |
| `cdn_profile_name`    | The name of the CDN profile                      | string | `"mycdnprofile"`            |
| `cdn_sku`             | The SKU for the CDN profile                      | string | `"Standard_Microsoft"`      |
| `cdn_endpoint_name`   | The name of the CDN endpoint                     | string | `"mycdnendpoint"`           |
| `origin_host`         | The hostname of the origin server                | string | `"myorigin.example.com"`    |
| `tags`                | A map of tags to assign to resources             | map    | `{ Environment = "CDN", Owner = "IT" }` |

## Usage

1. Clone the repository and navigate to the cdn directory.
2. Update the `terraform.tfvars` file with your values.
3. Initialize and apply the Terraform configuration:

```bash
terraform init
terraform plan
terraform apply
```

## Outputs

| Output Name             | Description                                 |
|-------------------------|---------------------------------------------|
| `cdn_profile_id`        | The ID of the CDN profile                   |
| `cdn_endpoint_id`       | The ID of the CDN endpoint                  |
| `cdn_endpoint_host_name`| The host name of the CDN endpoint           |

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1283-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-03</p>
</div>
<!-- END BADGE -->
