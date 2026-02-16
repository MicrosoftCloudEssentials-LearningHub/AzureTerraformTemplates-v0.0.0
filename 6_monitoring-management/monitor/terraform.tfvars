resource_group_name = "rg-monitoring-dev-monitor"
location            = "eastus"

append_random_suffix = true
random_suffix_length = 6

action_group_name       = "ag-monitoring-dev"
action_group_short_name = "alerts"

use_current_user_as_admin = true

# Optional override (UPNs):
# admin_members = [
#   "user@domain.com"
# ]

# Optional single email:
# email_address = "user@domain.com"

use_common_alert_schema = true

tags = {
  env  = "dev"
  area = "monitoring-management"
  iac  = "terraform"
}
