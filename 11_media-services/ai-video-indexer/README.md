# Terraform Template: <br/> Media Services (retired) → Azure AI Video Indexer (ARM-based via AzAPI)

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-10

------------------------------------------

> This template deploys an **Azure AI Video Indexer** account (ARM-based) plus its required **Storage Account**, and grants the Video Indexer managed identity the **Storage Blob Data Contributor** role on the storage account.

> [!IMPORTANT]
> **Azure Media Services (AMS) is retired** and Microsoft **blocks creation of new AMS accounts in all Azure regions**. This template uses Azure AI Video Indexer as the supported replacement for video/audio analysis workflows, and uses the `azapi` provider to deploy `Microsoft.VideoIndexer/accounts@2024-01-01`.

<img width="650" alt="image" src="https://github.com/user-attachments/assets/5535b973-51d3-4d96-8ec7-1877a3602b8a" />

<img width="650" alt="image" src="https://github.com/user-attachments/assets/f4779509-0c33-4f8c-8767-4c10ec9ab54e" />

## File Descriptions

- **main.tf**: Creates the Resource Group, Storage Account, Azure AI Video Indexer account (via `azapi_resource`), and role assignment.
- **variables.tf**: Defines the input variables.
- **provider.tf**: Configures the Azure providers (uses Azure CLI auth context).
- **terraform.tfvars**: Example values.
- **outputs.tf**: Exposes resource IDs and the Video Indexer principal ID.

## Variables

| Variable Name | Description | Type | Example Value |
| --- | --- | --- | --- |
| `resource_group_name` | The name of the resource group to create. | string | `"rg-media-services-dev"` |
| `location` | Azure region for deployment. | string | `"East US"` |
| `video_indexer_account_name` | Azure AI Video Indexer account name. | string | `"vi-media-dev-001"` |
| `storage_account_name` | Storage account name (globally unique). | string | `"stmediadev001abc"` |
| `tags` | Tags applied to supported resources. | map(string) | `{ env = "dev" }` |

## Usage

1. Authenticate:

   ```sh
   az login
   ```

2. (Optional) Select subscription:

   ```sh
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

## Outputs

| Output Name | Description |
| --- | --- |
| `video_indexer_account_id` | The resource ID of the Azure AI Video Indexer account. |
| `video_indexer_principal_id` | The managed identity principal ID used for RBAC. |

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1857-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-16</p>
</div>
<!-- END BADGE -->
