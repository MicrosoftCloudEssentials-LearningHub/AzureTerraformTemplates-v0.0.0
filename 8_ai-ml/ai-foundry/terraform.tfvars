resource_group_name = "rg-ai-foundry-dev"
location            = "eastus"

append_random_suffix = true
random_suffix_length = 6

foundry_account_name            = "aifoundry-dev"
sku_name                        = "S0"
allow_project_management        = true
public_network_access_enabled   = true
enable_system_assigned_identity = true

create_project      = true
project_description = ""

tags = {
  env  = "dev"
  area = "ai-ml"
  iac  = "terraform"
}
