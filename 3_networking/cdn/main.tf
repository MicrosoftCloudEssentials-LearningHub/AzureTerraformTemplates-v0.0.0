# main.tf
# This file contains the main configuration for creating an Azure CDN Profile and Endpoint.

# Resource Group
resource "azurerm_resource_group" "cdn" {
  name     = var.resource_group_name
  location = var.location
}

# CDN Profile
resource "azurerm_cdn_profile" "cdn" {
  name                = var.cdn_profile_name
  location            = azurerm_resource_group.cdn.location
  resource_group_name = azurerm_resource_group.cdn.name
  sku                 = var.cdn_sku
  tags                = var.tags
}

# CDN Endpoint
resource "azurerm_cdn_endpoint" "cdn" {
  name                = var.cdn_endpoint_name
  profile_name        = azurerm_cdn_profile.cdn.name
  location            = azurerm_resource_group.cdn.location
  resource_group_name = azurerm_resource_group.cdn.name
  origin_host_header  = var.origin_host
  is_http_allowed     = true
  is_https_allowed    = true

  origin {
    name      = "origin1"
    host_name = var.origin_host
    http_port = 80
    https_port = 443
  }
}