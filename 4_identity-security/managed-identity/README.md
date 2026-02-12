# Terraform Template - User Assigned Managed Identity

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-09

------------------------------------------

> This template contains Terraform configurations to create an Azure User Assigned Managed Identity with dependencies on a Resource Group.

<img width="650" alt="image" src="https://github.com/user-attachments/assets/8149b211-3565-4c74-b7e0-17a15d0e3f1d" />

<img width="650" alt="image" src="https://github.com/user-attachments/assets/ab38d984-bd82-46d6-afc3-e11ea5175920" />

## File Descriptions

- **main.tf**: Contains the main configuration for creating the Resource Group and the User Assigned Managed Identity.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the Azure provider to interact with Azure resources.
- **terraform.tfvars**: Provides example values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines outputs such as the identity resource ID, client ID, and principal ID.

## Variables

| Variable Name | Description | Type | Example Value |
| --- | --- | --- | --- |
| `resource_group_name` | The name of the Azure Resource Group to create and place the identity in. | string | `"rg-identity-security-dev"` |
| `location` | The Azure region where the Resource Group (and identity) will be created. | string | `"East US"` |
| `managed_identity_name` | The name of the User Assigned Managed Identity to create. | string | `"id-identity-security-dev-001"` |
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

> [!NOTES]
>
> - This template creates the Resource Group for you.
> - A User Assigned Managed Identity can be attached to Azure resources (VMs, App Service, Functions, etc.) and granted permissions via Azure RBAC.

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1790-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-12</p>
</div>
<!-- END BADGE -->
