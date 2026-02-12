# Terraform Template - Azure Synapse Analytics (Workspace)

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-12

------------------------------------------

> This template contains Terraform configurations to create an Azure Synapse Analytics workspace backed by an ADLS Gen2 filesystem.

> [!IMPORTANT]
> Azure Synapse always uses a **managed resource group** (configured by `managed_resource_group_name`). This is created and managed by the Synapse service itself and is required for the workspace to operate. You will see **two resource groups** in Azure: your main RG plus the Synapse-managed RG.

<div align="center">
  <img width="650" alt="image" src="https://github.com/user-attachments/assets/f64e70e3-9d12-4a5e-8bbd-1c7852be7a96" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>

<div align="center">
  <img width="650" alt="image" src="https://github.com/user-attachments/assets/e3bc9dea-fda4-4be5-b5d0-a18fbcfccf4b" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>

<div align="center">
  <img width="650" alt="image" src="https://github.com/user-attachments/assets/5436f362-9c6d-45d1-9cf0-bb7d428fd267" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>

> [!NOTE]
>
> - This template creates the Storage Account and filesystem via the AzAPI provider (management plane) to avoid key-based Storage data-plane operations (common in environments where shared keys are disabled by policy).
> - Synapse validates the default data lake storage using the DFS URL format: `https://<accountname>.dfs.core.windows.net/<filesystem>`. This template passes that format to `azurerm_synapse_workspace`.
> - Synapse workspace names are globally unique. If you disable `append_random_suffix`, you may hit name collisions.
> - The SQL admin password must meet complexity rules (at least 3 of: upper/lower/digit/special). Use `TF_VAR_sql_administrator_password` to avoid committing secrets.

## File Descriptions

- **main.tf**: Creates the Resource Group, Storage Account + filesystem (ADLS Gen2), and Synapse Workspace.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the AzureRM + AzAPI providers.
- **terraform.tfvars**: Provides example values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines outputs such as the Synapse workspace ID.

## Variables

| Variable Name | Description | Type | Example Value |
| --- | --- | --- | --- |
| `resource_group_name` | Resource Group name to create/deploy into. | string | `"rg-analytics-dev"` |
| `location` | Azure region for the deployment. | string | `"eastus"` |
| `synapse_workspace_name` | Base Synapse workspace name. If suffix enabled, final is `<base>-<suffix>`. | string | `"synw-analytics-dev"` |
| `managed_resource_group_name` | Optional base managed RG name for Synapse. If omitted, auto-generated. | string | `null` |
| `storage_account_name` | Base storage account name. If suffix enabled, final is `<base><suffix>` (no dash). | string | `"stadlsanalyticsdev"` |
| `filesystem_name` | ADLS Gen2 filesystem name (container). | string | `"synapse"` |
| `sql_administrator_login` | Synapse SQL admin login. | string | `"sqladminuser"` |
| `sql_administrator_password` | Synapse SQL admin password (prefer env var). | string | `"<set via TF_VAR_sql_administrator_password>"` |
| `append_random_suffix` | Append a random suffix to avoid global collisions. | bool | `true` |
| `random_suffix_length` | Length of the random suffix when enabled. | number | `6` |
| `tags` | Tags applied to resources. | map(string) | `{ "env": "dev" }` |

## Usage

1. Authenticate:

   ```sh
   az login
   ````

   ```sh
   az account show
   # If needed:
   az account set --subscription "<subscription-id-or-name>"
   ```

3. Provide the SQL admin password without committing it:

   PowerShell:

   ```powershell
   $env:TF_VAR_sql_administrator_password = "<your-strong-password>"
   ```

4. Initialize:

   ```sh
   terraform init -upgrade
   ```

5. Validate and plan:

   ```sh
   terraform validate
   terraform plan
   ```

6. Apply:

   ```sh
   terraform apply -auto-approve
   ```
   
<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1790-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-12</p>
</div>
<!-- END BADGE -->
