# Terraform Template - Azure Data Factory

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-11

------------------------------------------

> This template contains Terraform configurations to create an Azure Data Factory instance with a system-assigned managed identity.

> [!NOTE]
>
> - This template creates the Resource Group for you.
> - Azure Data Factory names are globally unique. If you disable `append_random_suffix`, you may hit `DataFactoryNameInUse` and need to change `data_factory_name`.

<div align="center">
  <img width="650" alt="image" src="https://github.com/user-attachments/assets/49954b0e-348c-4b6f-bb84-c5939452ae17" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>

<div align="center">
  <img width="650" alt="image" src="https://github.com/user-attachments/assets/6106e50d-0c7e-4eab-8845-12bc6ee10069" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>

<div align="center">
  <img width="650" alt="image" src="https://github.com/user-attachments/assets/966f05b9-3a25-467c-9ca8-659c15a1cf3b" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>

## File Descriptions

- **main.tf**: Creates the Resource Group and Azure Data Factory.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the Azure provider to interact with Azure resources.
- **terraform.tfvars**: Provides example values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines outputs such as the Data Factory ID and managed identity principal ID.

## Variables

| Variable Name | Description | Type | Example Value |
| --- | --- | --- | --- |
| `resource_group_name` | Resource Group name to create/deploy into. | string | `"rg-analytics-dev"` |
| `location` | Azure region for the deployment. | string | `"eastus"` |
| `data_factory_name` | Base Azure Data Factory name. If random suffix is enabled, final name is `<base>-<suffix>`. | string | `"adf-analytics-dev"` |
| `append_random_suffix` | Append a random suffix to avoid global name collisions. | bool | `true` |
| `random_suffix_length` | Length of the random suffix when enabled. | number | `6` |
| `public_network_enabled` | Enable/disable public network access for Data Factory. | bool | `true` |
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

3. Initialize:

   ```sh
   terraform init -upgrade
   ```

4. Validate and plan:

   ```sh
   terraform validate
   terraform plan
   ```

5. Apply:

   ```sh
   terraform apply -auto-approve
   ```

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1706-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-11</p>
</div>
<!-- END BADGE -->
