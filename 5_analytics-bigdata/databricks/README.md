# Terraform Template - Azure Databricks (Workspace)

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-12

------------------------------------------

> This template contains Terraform configurations to create an Azure Databricks workspace.

> [!IMPORTANT]
>
> - Azure Databricks creates a **managed resource group** for service-managed infrastructure. You will typically see **two resource groups**: your main RG plus the Databricks-managed RG. This is expected behavior.
> - If you disable `append_random_suffix`, you may hit name collisions.

<div align="center">
  <img width="650" alt="image" src="https://github.com/user-attachments/assets/5f4cf7a6-9317-4d34-adcf-c493297ab814" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>

<div align="center">
  <img width="650" alt="image" src="https://github.com/user-attachments/assets/90778a82-a56f-4b56-8673-66339073c746" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>

<div align="center">
  <img width="650" alt="image" src="https://github.com/user-attachments/assets/eb7c2c5c-2f1b-4bb1-8266-5e3093f28371" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>

## File Descriptions

- **main.tf**: Creates/updates the Resource Group (idempotent ARM PUT) and the Databricks workspace.
- **variables.tf**: Defines input variables used in the Terraform configuration.
- **provider.tf**: Configures the AzureRM + AzAPI + Random providers.
- **terraform.tfvars**: Example values for variables.
- **outputs.tf**: Outputs such as the workspace ID and URL.

## Variables

| Variable Name | Description | Type | Example Value |
| --- | --- | --- | --- |
| `resource_group_name` | Resource Group name to deploy into (created if missing). | string | `"rg-analytics-dev"` |
| `location` | Azure region for the deployment. | string | `"eastus"` |
| `databricks_workspace_name` | Base workspace name. If suffix enabled, final is `<base>-<suffix>`. | string | `"dbw-analytics-dev"` |
| `sku` | Workspace SKU (`standard`, `premium`, `trial`). | string | `"standard"` |
| `managed_resource_group_name` | Optional base managed RG name. If omitted, Databricks auto-generates it. | string | `null` |
| `append_random_suffix` | Append random suffix to reduce name collisions. | bool | `true` |
| `random_suffix_length` | Length of the suffix when enabled. | number | `6` |
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
  <img src="https://img.shields.io/badge/Total%20views-1790-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-12</p>
</div>
<!-- END BADGE -->
