# Example values for the Key Vault template

resource_group_name = "rg-identity-security-dev"
location            = "East US"
key_vault_name      = "kvidentitydev001"

# Key Vault names are globally unique; keep this true to avoid collisions.
key_vault_name_use_random_suffix = true



# Optional
sku_name                      = "standard"
enable_rbac_authorization     = true
public_network_access_enabled = true
soft_delete_retention_days    = 90
purge_protection_enabled      = false

tags = {
  env   = "dev"
  app   = "identity-security"
  owner = "terraform"
}

# Network ACLs (optional)
network_default_action     = "Allow"
network_bypass             = "AzureServices"
ip_rules                   = []
virtual_network_subnet_ids = []
