resource_group_name = "rg-tsi-dev"
location            = "eastus"

iothub_name = "iothub-tsi-dev"

tsi_environment_name    = "tsi-dev"
tsi_sku_name            = "S1"
tsi_data_retention_time = "P31D"
tsi_event_source_name   = "iothub"

tags = {
  env = "dev"
}
