# Example values for the Managed Identity template

resource_group_name     = "rg-identity-security-dev"
location                = "East US"
managed_identity_name   = "id-identity-security-dev-001"

tags = {
  env   = "dev"
  app   = "identity-security"
  owner = "terraform"
}
