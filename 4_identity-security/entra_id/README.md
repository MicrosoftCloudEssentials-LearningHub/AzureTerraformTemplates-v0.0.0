# Terraform Template - Microsoft Entra ID (Entra ID)

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-03

------------------------------------------

> High level: creates a Microsoft Entra ID application registration (tenant-level). Optionally creates a service principal, a client secret, and (optionally) assigns an Azure RBAC role at a provided scope.

> High level: creates a Microsoft Entra ID application registration (tenant-level). Optionally creates a service principal and a client secret.

> No Azure resource group is required unless you choose a resource-group RBAC scope (because the RG must already exist for role assignment).

## File Descriptions

- **main.tf**: Creates the application registration, optional service principal, and optional client secret.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the AzureRM and AzureAD providers.
- **terraform.tfvars**: Provides example values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines outputs such as the application client ID, object IDs, and the client secret.

## Variables

Below is a list of variables used in this template, their expected values, types, and examples:

| Variable Name | Description | Type | Example Value |
| --- | --- | --- | --- |
| `app_display_name` | The display name for the Entra ID application registration. | string | `"example-entra-app"` |
| `sign_in_audience` | The Microsoft account types supported for the application. | string | `"AzureADMyOrg"` |
| `application_owners` | Optional set of object IDs to set as owners. If empty, the current principal is used. | set(string) | `["00000000-0000-0000-0000-000000000000"]` |
| `create_service_principal` | Whether to create a service principal for the application. | bool | `true` |
| `use_existing_service_principal` | Import existing service principal linked to the application when present. | bool | `true` |
| `create_client_secret` | Whether to create a client secret (application password). | bool | `true` |
| `client_secret_display_name` | Display name for the client secret. | string | `"terraform-client-secret"` |
| `client_secret_end_date_relative` | Relative duration for which the secret is valid. | string | `"4320h"` |

## Usage

1. Authenticate:

   ```sh
   az login
   ```

2. Initialize and apply:

   ```sh
   terraform init -upgrade
   terraform apply -auto-approve
   ```

   Keep your `terraform.tfvars` minimal: set only `app_display_name`, and explicitly opt-in to optional resources (service principal, client secret, RBAC scope) when you need them.

3. Validate and plan:

   ```sh
   terraform validate
   terraform plan
   ```

4. Apply:

   ```sh
   terraform apply -auto-approve
   ```

If you need Azure RBAC role assignments, use an AzureRM-based template (requires a subscription context and scope such as a subscription or resource group).

> These `TF_VAR_*` environment variables are scoped to your current shell session.

## Notes

- Creating applications, service principals, and secrets requires Microsoft Entra ID permissions (e.g., Application Administrator or appropriate Microsoft Graph application roles).
- This template does not create Azure resources and does not require a resource group.

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1615-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-07</p>
</div>
<!-- END BADGE -->
