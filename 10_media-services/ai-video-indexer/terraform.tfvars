resource_group_name        = "rg-media-services-dev"
location                   = "East US"
video_indexer_account_name = "vi-media-dev-001"
storage_account_name       = "stmediadev001abc" # must be globally unique

tags = {
  env  = "dev"
  iac  = "terraform"
  area = "media-services"
}
