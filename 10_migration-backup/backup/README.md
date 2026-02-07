# Terraform Template - Azure Data Protection Backup Vault

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-03

----------

> This template contains Terraform configurations to create and manage an Azure Data Protection Backup Vault.

<p align="center">
    <img width="700" alt="image" src="https://github.com/user-attachments/assets/31b1d21a-2f0d-43d6-8898-22524685e425">
</p>

## File Descriptions

- **main.tf**: Contains the main configuration for creating the Data Protection Backup Vault.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs such as the Backup Vault ID.

## Variables

| Variable Name | Description | Type | Example Value |
| --- | --- | --- | --- |
| `resource_group_name` | The name of the resource group | string | `"my-backup-rg"` |
| `location` | The Azure region to deploy resources | string | `"eastus"` |
| `backup_vault_name` | The name of the Data Protection Backup Vault | string | `"my-backup-vault"` |
| `redundancy` | The redundancy setting for the backup vault | string | `"LocallyRedundant"` |
| `tags` | A map of tags to assign to resources | map | `{ Environment = "Backup", Owner = "IT" }` |

## Usage

1. Clone the repository and navigate to the backup directory.
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
| `backup_vault_id` | The ID of the Data Protection Backup Vault |

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1615-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-07</p>
</div>
<!-- END BADGE -->
