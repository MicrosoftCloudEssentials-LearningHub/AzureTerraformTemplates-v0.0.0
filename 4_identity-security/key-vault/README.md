# Terraform Template - Azure Key Vault

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-09

------------------------------------------

> This template contains Terraform configurations to create and manage an Azure Key Vault with dependencies on a Resource Group.

<img width="650" alt="image" src="https://github.com/user-attachments/assets/135bf519-e661-4eb0-8705-90db25b29491" />

> [!NOTE]
> Key Vault data-plane access (secrets/keys/certificates) depends on your authorization mode:
>
> - If `enable_rbac_authorization = true`, grant Azure RBAC roles (for example: Key Vault Secrets Officer) at the vault scope.
> - If `enable_rbac_authorization = false`, you must manage Key Vault access policies (not included in this minimal template).

## File Descriptions

- **main.tf**: Contains the main configuration for creating the Azure Key Vault and the Resource Group it depends on.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the Azure provider to interact with Azure resources.
- **terraform.tfvars**: Provides example values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines the outputs of the Terraform configuration, such as the Key Vault URI and Resource Group.

## Variables

Below is a list of variables used in this template, their expected values, types, and examples:

| Variable Name | Description | Type | Example Value |
| --- | --- | --- | --- |
| `resource_group_name` | The name of the Azure Resource Group to associate the Key Vault with. | string | `"rg-identity-security-dev"` |
| `location` | The Azure region where the Resource Group will be created. | string | `"East US"` |
| `key_vault_name` | The name of the Azure Key Vault to create. | string | `"kvidentitydev001"` |
| `key_vault_name_use_random_suffix` | Append a short random suffix to avoid global name collisions. | bool | `true` |
| `sku_name` | The SKU name for Key Vault (`standard` or `premium`). | string | `"standard"` |
| `enable_rbac_authorization` | Use Azure RBAC for data-plane permissions. | bool | `true` |
| `public_network_access_enabled` | Enable or disable public network access. | bool | `true` |
| `soft_delete_retention_days` | Soft delete retention days (7-90). | number | `90` |
| `purge_protection_enabled` | Enable purge protection (affects destroy). | bool | `false` |
| `network_default_action` | Network ACL default action (`Allow` or `Deny`). | string | `"Allow"` |
| `network_bypass` | Firewall bypass (`AzureServices` or `None`). | string | `"AzureServices"` |
| `ip_rules` | List of public IPs/CIDRs allowed. | list(string) | `[]` |
| `virtual_network_subnet_ids` | List of subnet IDs allowed. | list(string) | `[]` |
| `tags` | A map of tags to assign to the resources. | map(string) | `{ "env": "dev" }` |

## Usage

1. Authenticate:

   ```sh
   az login
   ```

2. Ensure Azure CLI has the correct active subscription:

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

## Notes

- This template creates the Resource Group for you.
- Key Vault names are globally unique. If you see `VaultAlreadyExists`, either change the base name or keep `key_vault_name_use_random_suffix = true`.
- If you enable `purge_protection_enabled`, Key Vault deletion becomes more restrictive and `terraform destroy` may fail until purge protection rules allow cleanup.

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1646-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-09</p>
</div>
<!-- END BADGE -->
