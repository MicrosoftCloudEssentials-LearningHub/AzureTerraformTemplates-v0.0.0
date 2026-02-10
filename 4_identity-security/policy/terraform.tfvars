# Example values for the Azure Policy Assignment template

resource_group_name    = "rg-identity-security-dev"
location               = "East US"
managed_identity_name  = "id-policy-identity-security-dev-001"
policy_assignment_name = "pa-identity-security-dev-001"

# Provide a built-in or custom policy definition ID.
# Example format: /providers/Microsoft.Authorization/policyDefinitions/<policyDefinitionId>
# Tip: list definitions with:
#   az policy definition list --query "[0].id" -o tsv
policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/0004bbf0-5099-4179-869e-e9ffe5fb0945"

# Optional
policy_assignment_display_name = "Identity/Security policy assignment (dev)"
policy_assignment_description  = "Example policy assignment scoped to a resource group."

# Optional parameters JSON (only if your policy expects parameters)
# policy_parameters_json = jsonencode({
#   effect = {
#     value = "Audit"
#   }
# })

enforce = true

tags = {
  env   = "dev"
  app   = "identity-security"
  owner = "terraform"
}
