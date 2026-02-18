# Example values for the Azure CDN template (Media Services).

resource_group_name = "rg-media-services-dev"
location            = "East US"

cdn_profile_name  = "cdn-media-services-dev-001"
cdn_sku           = "Standard_AzureFrontDoor"
cdn_endpoint_name = "cdn-media-dev-001"

# Example: storage or web origin hostname (no scheme, no path)
origin_host = "myorigin.example.com"

tags = {
  env   = "dev"
  app   = "media-services"
  owner = "terraform"
}
