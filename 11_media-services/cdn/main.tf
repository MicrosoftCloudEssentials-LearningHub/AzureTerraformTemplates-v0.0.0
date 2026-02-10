# main.tf
# This file contains the main configuration for creating an Azure Front Door (Standard/Premium)
# profile and endpoint (Azure CDN/Front Door modern offering).

resource "azurerm_resource_group" "cdn" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

resource "azurerm_cdn_frontdoor_profile" "cdn" {
  name                = var.cdn_profile_name
  resource_group_name = azurerm_resource_group.cdn.name
  sku_name            = var.cdn_sku

  tags = var.tags
}

resource "azurerm_cdn_frontdoor_endpoint" "cdn" {
  name                     = var.cdn_endpoint_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.cdn.id

  tags = var.tags
}

resource "azurerm_cdn_frontdoor_origin_group" "cdn" {
  name                     = "${var.cdn_endpoint_name}-og"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.cdn.id

  load_balancing {
    additional_latency_in_milliseconds = 50
    sample_size                        = 4
    successful_samples_required        = 3
  }
}

resource "azurerm_cdn_frontdoor_origin" "cdn" {
  name                          = "origin1"
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.cdn.id

  enabled                        = true
  certificate_name_check_enabled = false

  host_name          = var.origin_host
  origin_host_header = var.origin_host
  http_port          = 80
  https_port         = 443

  priority = 1
  weight   = 500
}

resource "azurerm_cdn_frontdoor_route" "cdn" {
  name                          = "${var.cdn_endpoint_name}-route"
  cdn_frontdoor_endpoint_id     = azurerm_cdn_frontdoor_endpoint.cdn.id
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.cdn.id
  cdn_frontdoor_origin_ids      = [azurerm_cdn_frontdoor_origin.cdn.id]

  enabled = true

  forwarding_protocol    = "HttpsOnly"
  https_redirect_enabled = true
  patterns_to_match      = ["/*"]
  supported_protocols    = ["Http", "Https"]

  link_to_default_domain = true
}
