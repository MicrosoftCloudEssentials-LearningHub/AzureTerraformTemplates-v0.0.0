resource_group_name = "rg-ai-services-dev"
location            = "eastus"

append_random_suffix = true
random_suffix_length = 6

cognitive_account_name = "aiservices-dev"
kind                   = "CognitiveServices"
sku_name               = "S0"

public_network_access_enabled   = true
enable_system_assigned_identity = true

# Optional
# custom_subdomain_name = "myaiservicesdev"

tags = {
  env  = "dev"
  area = "ai-ml"
  iac  = "terraform"
}
