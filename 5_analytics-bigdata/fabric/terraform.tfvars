resource_group_name = "rg-analytics-dev-fabric"
location            = "eastus"

append_random_suffix = true
random_suffix_length = 6

capacity_name = "fabric-capacity-dev"

use_current_user_as_admin = true

# Optional override (UPNs):
# admin_members = [
#   "user@domain.com"
# ]

sku_name = "F2"
sku_tier = "Fabric"

tags = {
  env  = "dev"
  area = "analytics-bigdata"
  iac  = "terraform"
}
