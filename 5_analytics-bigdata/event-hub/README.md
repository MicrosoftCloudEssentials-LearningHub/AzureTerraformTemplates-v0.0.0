# Terraform Template - Azure Event Hubs

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-16

------------------------------------------

> This template contains Terraform configurations to create an Azure Event Hubs namespace and an Event Hub (optionally with consumer groups).

> [!NOTE]
> - The Resource Group is created via the AzAPI provider (management plane) to keep creation idempotent (ARM PUT) and align with other templates in this repository.
> - Event Hubs namespace names are globally unique. Keeping `append_random_suffix = true` helps avoid collisions.

<div align="center">
  <img width="650" alt="image" src="https://github.com/user-attachments/assets/2d9b80e2-b1d3-41be-a5bb-a7a4591b44be" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>

<div align="center">
  <img width="650" alt="image" src="https://github.com/user-attachments/assets/72fdee04-5145-4b78-9025-6f946c78f45e" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>

## File Descriptions

- **main.tf**: Creates the Resource Group, Event Hubs Namespace, Event Hub, and optional consumer groups.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the AzureRM + AzAPI providers.
- **terraform.tfvars**: Example values for the variables defined in `variables.tf`.
- **output.tf**: Defines outputs such as namespace and Event Hub IDs.

## Variables

| Variable Name | Description | Type | Example Value |
| --- | --- | --- | --- |
| `resource_group_name` | Resource Group name to create/deploy into. | string | `"rg-analytics-dev-EH"` |
| `location` | Azure region for the deployment. | string | `"eastus"` |
| `eventhub_namespace_name` | Base namespace name. If suffix enabled, final is `<base>-<suffix>`. | string | `"ehns-analytics-dev"` |
| `eventhub_name` | Event Hub name inside the namespace. | string | `"events"` |
| `sku` | Namespace SKU (`Basic`, `Standard`, `Premium`). | string | `"Standard"` |
| `capacity` | Namespace capacity (ignored for `Basic`). | number | `1` |
| `partition_count` | Event Hub partitions. | number | `2` |
| `message_retention` | Retention in days. | number | `1` |
| `consumer_group_names` | Optional consumer groups to create. | list(string) | `["cg-default"]` |
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
