# Adjust this as needed
# tfvars -> values used for deployment process 
resource_group_name = "rg-analytics-dev-EH"
location            = "eastus"

append_random_suffix = true
random_suffix_length = 6

eventhub_namespace_name = "ehns-analytics-dev"
eventhub_name           = "events"

sku      = "Standard"
capacity = 1

partition_count   = 2
message_retention = 1

consumer_group_names = [
  "cg-default"
]

tags = {
  env  = "dev"
  area = "analytics-bigdata"
  iac  = "terraform"
}
