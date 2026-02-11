resource_group_name = "rg-analytics-dev"
location            = "eastus"

# Synapse workspace names are globally unique.
# This template appends a random suffix by default to reduce collisions.
synapse_workspace_name      = "synw-analytics-dev"
managed_resource_group_name = "rg-synapse-managed-analytics-dev"

# Storage account names must be lowercase alphanumeric and globally unique.
# This template appends a random suffix by default (without dashes).
storage_account_name = "stadlsanalyticsdev"
filesystem_name      = "synapse"

sql_administrator_login = "sqladminuser"

# Do NOT commit real passwords. Prefer using:
#   $env:TF_VAR_sql_administrator_password = "<your-strong-password>"
sql_administrator_password = "ChangeMe123!"

append_random_suffix = true
random_suffix_length = 6

tags = {
  env  = "dev"
  area = "analytics-bigdata"
  iac  = "terraform"
}
