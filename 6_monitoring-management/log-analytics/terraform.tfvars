resource_group_name = "rg-monitoring-dev-law"
location            = "eastus"

append_random_suffix = true
random_suffix_length = 6

workspace_name    = "law-monitoring-dev"
sku               = "PerGB2018"
retention_in_days = 30
daily_quota_gb    = -1

use_current_user_as_admin = true

# Optional override (UPNs):
# admin_members = [
#   "user@domain.com"
# ]

tags = {
  env  = "dev"
  area = "monitoring-management"
  iac  = "terraform"
}
