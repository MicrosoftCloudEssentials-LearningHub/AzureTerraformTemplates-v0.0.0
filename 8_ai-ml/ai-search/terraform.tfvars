resource_group_name = "rg-ai-search-dev"
location            = "eastus"

append_random_suffix = true
random_suffix_length = 6

search_service_name = "srch-dev"
sku                 = "basic"
replica_count       = 1
partition_count     = 1

public_network_access_enabled = true
local_authentication_enabled  = true

tags = {
  env  = "dev"
  area = "ai-ml"
  iac  = "terraform"
}
