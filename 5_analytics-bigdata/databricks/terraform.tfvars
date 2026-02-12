resource_group_name = "rg-analytics-dev"
location            = "eastus"

# Databricks workspace names are unique within your subscription.
# This template appends a random suffix by default to reduce collisions.
databricks_workspace_name = "dbw-analytics-dev"

# Optional. If omitted, Databricks auto-generates the managed resource group name.
# managed_resource_group_name = "rg-databricks-managed-analytics-dev"

# SKU: standard | premium | trial
sku = "standard"

append_random_suffix = true
random_suffix_length = 6

tags = {
  env  = "dev"
  area = "analytics-bigdata"
  iac  = "terraform"
}
