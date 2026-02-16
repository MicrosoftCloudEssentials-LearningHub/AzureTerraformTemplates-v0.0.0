resource_group_name = "rg-monitoring-dev-auto"
location            = "eastus"

append_random_suffix = true
random_suffix_length = 6

automation_account_name         = "aa-monitoring-dev"
sku_name                        = "Basic"
enable_system_assigned_identity = true

tags = {
  env  = "dev"
  area = "monitoring-management"
  iac  = "terraform"
}
