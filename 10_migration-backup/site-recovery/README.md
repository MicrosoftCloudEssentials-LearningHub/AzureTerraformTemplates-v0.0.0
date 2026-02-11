# Terraform Template - Azure Site Recovery (Recovery Services Vault)

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-09

----------

> This template contains Terraform configurations to create and manage an Azure Recovery Services Vault for Site Recovery.

<p align="center">
    <img width="700" alt="image" src="https://github.com/user-attachments/assets/05f960ad-18d2-4cc3-9229-21d81354bdd5">
</p>

## File Descriptions

- **main.tf**: Contains the main configuration for creating the Recovery Services Vault.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **terraform.tfvars**: Provides default values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs such as the Recovery Services Vault ID.

## Variables

| Variable Name | Description | Type | Example Value |
| --- | --- | --- | --- |
| `resource_group_name` | The name of the resource group | string | `"my-siterecovery-rg"` |
| `location` | The Azure region to deploy resources | string | `"eastus"` |
| `vault_name` | The name of the Recovery Services Vault | string | `"my-siterecovery-vault"` |
| `sku` | The SKU for the Recovery Services Vault | string | `"Standard"` |
| `tags` | A map of tags to assign to resources | map | `{ Environment = "SiteRecovery", Owner = "IT" }` |

## Usage

1. Clone the repository and navigate to the site-recovery directory.
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
| `recovery_services_vault_id` | The ID of the Recovery Services Vault |

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1706-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-11</p>
</div>
<!-- END BADGE -->
