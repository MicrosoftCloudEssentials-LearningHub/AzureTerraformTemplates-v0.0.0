# Terraform Template - Azure Policy Assignment (with Managed Identity)

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2026-02-10

------------------------------------------

> This template contains Terraform configurations to create an Azure Policy Assignment scoped to a Resource Group, using a User Assigned Managed Identity.

<img width="650" alt="image" src="https://github.com/user-attachments/assets/96147a10-ef43-457a-9823-a6d4609ac7ad" />

<img width="650" alt="image" src="https://github.com/user-attachments/assets/b86789c2-1918-4ea1-a773-1a4b40aec23d" />

<img width="650" alt="image" src="https://github.com/user-attachments/assets/6a96b324-ef48-4547-a91d-cce10553622d" />

> [!NOTE]
> Some Azure Policies (for example, `DeployIfNotExists` / remediation scenarios) require an identity on the assignment. This template always creates a User Assigned Managed Identity and attaches it to the assignment.

## File Descriptions

- **main.tf**: Creates the Resource Group, User Assigned Managed Identity, and the Azure Policy Assignment.
- **variables.tf**: Defines the input variables used in the Terraform configuration.
- **provider.tf**: Configures the Azure provider to interact with Azure resources.
- **terraform.tfvars**: Provides example values for the variables defined in `variables.tf`.
- **outputs.tf**: Defines outputs such as the policy assignment ID and identity IDs.

## Variables

| Variable Name | Description | Type | Example Value |
| --- | --- | --- | --- |
| `resource_group_name` | The name of the Azure Resource Group to create and scope the assignment to. | string | `"rg-identity-security-dev"` |
| `location` | The Azure region where the Resource Group and identity will be created. | string | `"East US"` |
| `managed_identity_name` | The name of the User Assigned Managed Identity to create. | string | `"id-policy-identity-security-dev-001"` |
| `policy_assignment_name` | The name of the Azure Policy Assignment. | string | `"pa-identity-security-dev-001"` |
| `policy_definition_id` | The policy definition resource ID (built-in or custom). | string | `"/providers/Microsoft.Authorization/policyDefinitions/<id>"` |
| `policy_assignment_display_name` | Optional display name for the assignment. | string | `"Identity/Security policy assignment (dev)"` |
| `policy_assignment_description` | Optional description for the assignment. | string | `"Example policy assignment scoped to a resource group."` |
| `policy_parameters_json` | Optional policy parameters JSON string. | string | `jsonencode({ effect = { value = "Audit" } })` |
| `enforce` | Whether the policy should be enforced. | bool | `true` |
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

> [!NOTE]
>
> - This template creates the Resource Group for you.
> - If you leave `policy_definition_id` as a placeholder, `terraform apply` will fail with `PolicyDefinitionNotFound`. Use Azure CLI to find a valid definition ID (built-in or custom), for example: `az policy definition list --query "[0].id" -o tsv`.
> - If your policy requires remediation, you may need to grant the assignment identity additional Azure RBAC permissions at the assignment scope.

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-1857-limegreen" alt="Total views">
  <p>Refresh Date: 2026-02-16</p>
</div>
<!-- END BADGE -->
