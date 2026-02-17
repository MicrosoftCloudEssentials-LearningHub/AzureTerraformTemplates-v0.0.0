# Terraform Template - Microsoft Fabric (Capacity)

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-17

------------------------------------------

> This template contains Terraform configurations to create a Microsoft Fabric capacity in Azure.

> [!IMPORTANT]
> Fabric capacity creation requires at least one admin member.
>
> - Option A (recommended): set `use_current_user_as_admin = true` and let Terraform resolve the current user UPN.
> - Option B: set `admin_members` explicitly to one or more UPNs like `user@domain.com`.
> To avoid committing identities, prefer environment variables:
> - PowerShell: `$env:TF_VAR_admin_members='["user@domain.com"]'`
> - PowerShell (auto): keep `use_current_user_as_admin = true` and omit `admin_members`.

> [!NOTE]
>
> - The Fabric capacity resource is created via the AzAPI provider using the ARM resource type `Microsoft.Fabric/capacities@2023-11-01`.
> - The Resource Group is created via AzAPI (idempotent ARM PUT) to align with other templates in this repository.

<img width="650" alt="image" src="https://github.com/user-attachments/assets/fb74b695-b13d-4ca1-aae6-d5386e67660a" />

<img width="650" alt="image" src="https://github.com/user-attachments/assets/8bb7c264-8a8f-4c8e-b7d3-62e54d464b62" />

<img width="650" alt="image" src="https://github.com/user-attachments/assets/799fc378-a49a-4c0d-bc6d-3fde6361f5d7" />

## File Descriptions

- **main.tf**: Creates the Resource Group and the Fabric capacity (AzAPI).
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the AzureRM + AzAPI providers.
- **terraform.tfvars**: Example values for the variables defined in `variables.tf`.
- **output.tf**: Defines outputs such as Fabric capacity resource ID.

## Variables

| Variable Name | Description | Type | Example Value |
| --- | --- | --- | --- |
| `resource_group_name` | Resource Group name to create/deploy into. | string | `"rg-analytics-dev-fabric"` |
| `location` | Azure region for the deployment. | string | `"eastus"` |
| `capacity_name` | Base capacity name. If suffix enabled, final is `<base>-<suffix>`. | string | `"fabric-capacity-dev"` |
| `use_current_user_as_admin` | Auto-resolve current user as admin when `admin_members` is empty. | bool | `true` |
| `admin_members` | Optional explicit Fabric capacity admins (UPNs). Overrides auto mode. | list(string) | `[]` |
| `sku_name` | Capacity SKU (for example `F2`, `F4`, `F8`, ...). | string | `"F2"` |
| `sku_tier` | Capacity SKU tier. | string | `"Fabric"` |
| `append_random_suffix` | Append a random suffix to avoid collisions. | bool | `true` |
| `random_suffix_length` | Length of the random suffix when enabled. | number | `6` |
| `tags` | Tags applied to resources. | map(string) | `{ "env": "dev" }` |

## Usage

1. Authenticate:

   ```sh
   az login
   az account show
   # If needed:
   az account set --subscription "<subscription-id-or-name>"
   ```

2. Initialize:

   ```sh
   terraform init -upgrade
   ```

3. Validate and plan:

   ```sh
   terraform validate
   terraform plan
   ```

4. Apply:

   ```sh
   terraform apply -auto-approve
   ```

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1930-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-17</p>
</div>
<!-- END BADGE -->
