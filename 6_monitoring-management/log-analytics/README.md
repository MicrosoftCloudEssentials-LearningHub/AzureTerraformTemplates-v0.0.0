# Terraform Template - Log Analytics Workspace

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-17

------------------------------------------

> This template contains Terraform configurations to create an Azure Log Analytics workspace.

<img width="650" alt="image" src="https://github.com/user-attachments/assets/33236836-83f2-485f-ac21-2d50f0fd3250" />

<img width="650" alt="image" src="https://github.com/user-attachments/assets/31c6dfe7-ad1c-4107-a598-ded77e303414" />

## File Descriptions

- **main.tf**: Creates the Resource Group (AzAPI) and Log Analytics workspace.
- **variables.tf**: Input variables.
- **provider.tf**: AzureRM + AzAPI providers.
- **terraform.tfvars**: Example values.
- **outputs.tf**: Outputs (IDs/names).

## Variables

| Variable Name | Description | Type | Example Value |
| --- | --- | --- | --- |
| `resource_group_name` | Resource Group name to create/deploy into. | string | `"rg-monitoring-dev-law"` |
| `location` | Azure region for the deployment. | string | `"eastus"` |
| `workspace_name` | Base workspace name (suffix optional). | string | `"law-monitoring-dev"` |
| `sku` | Workspace SKU. | string | `"PerGB2018"` |
| `retention_in_days` | Retention in days (30-730). | number | `30` |
| `daily_quota_gb` | Daily ingestion cap (-1 unlimited). | number | `-1` |
| `append_random_suffix` | Append random suffix. | bool | `true` |
| `random_suffix_length` | Suffix length. | number | `6` |
| `use_current_user_as_admin` | Grant workspace role to current user if `admin_members` empty. | bool | `true` |
| `admin_members` | Optional UPN list to grant workspace role to. | list(string) | `["user@domain.com"]` |
| `admin_role_definition_name` | Role assigned to admin members. | string | `"Log Analytics Contributor"` |
| `tags` | Tags applied to resources. | map(string) | `{ "env": "dev" }` |

## Usage

```sh
az login
terraform init -upgrade
terraform validate
terraform plan
terraform apply -auto-approve
```

<!-- START BADGE -->
<div align="center">
 <img src="https://img.shields.io/badge/Total%20views-1930-limegreen" alt="Total views">
 <p>Refresh Date: 2026-02-17</p>
</div>
<!-- END BADGE -->
