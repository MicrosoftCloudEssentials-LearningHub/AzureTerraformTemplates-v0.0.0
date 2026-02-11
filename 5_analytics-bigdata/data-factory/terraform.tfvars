resource_group_name = "rg-analytics-dev"
location            = "eastus"

# Data Factory name must be globally unique.
# This template appends a random suffix by default to reduce collisions.
data_factory_name = "adf-analytics-dev"

append_random_suffix = true
random_suffix_length = 6

public_network_enabled = true

tags = {
  env  = "dev"
  area = "analytics-bigdata"
  iac  = "terraform"
}
