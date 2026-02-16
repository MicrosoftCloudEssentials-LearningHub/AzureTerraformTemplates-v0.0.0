resource_group_name = "rg-monitoring-dev-advisor"
location            = "eastus"

append_random_suffix = true
random_suffix_length = 6

email_address = "user@domain.com"

action_group_name       = "advisorAlert"
action_group_short_name = "advisor"

activity_log_alert_name = "AdvisorAlerts"

recommendation_category = "Cost"
recommendation_impact   = "Medium"

# Optional: scope to a specific resource group
# scope_resource_group_name = "rg-some-app-dev"

enabled     = true
description = ""

tags = {
  env  = "dev"
  area = "monitoring-management"
  iac  = "terraform"
}
