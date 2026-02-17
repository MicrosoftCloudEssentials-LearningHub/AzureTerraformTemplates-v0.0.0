resource_group_name = "rg-ai-ml-dev"
location            = "eastus"

append_random_suffix = true
random_suffix_length = 6

workspace_name = "mlw-dev"

storage_account_name_prefix      = "stml"
key_vault_name_prefix            = "kvml"
container_registry_name_prefix   = "acrml"
application_insights_name_prefix = "appi-ml"

public_network_access_enabled   = true
enable_system_assigned_identity = true

tags = {
  env  = "dev"
  area = "ai-ml"
  iac  = "terraform"
}
