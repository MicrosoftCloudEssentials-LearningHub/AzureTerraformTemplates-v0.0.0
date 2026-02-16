# main.tf
# Azure Front Door Standard/Premium configuration with required origin group and origin

resource "azurerm_resource_group" "fd" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_cdn_frontdoor_profile" "fd" {
  name                = var.front_door_name
  resource_group_name = azurerm_resource_group.fd.name
  sku_name            = "Standard_AzureFrontDoor"
}

resource "azurerm_cdn_frontdoor_endpoint" "fd" {
  name                     = var.frontend_endpoint_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.fd.id
}

resource "azurerm_cdn_frontdoor_origin_group" "fd" {
  name                     = "originGroup1"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.fd.id

  health_probe {
    interval_in_seconds = 30
    path                = var.health_probe_path
    protocol            = var.health_probe_protocol
    request_type        = "GET"
  }

  load_balancing {
    sample_size                 = 4
    successful_samples_required = 3
  }
}

resource "azurerm_cdn_frontdoor_origin" "fd" {
  name                           = "origin1"
  cdn_frontdoor_origin_group_id  = azurerm_cdn_frontdoor_origin_group.fd.id
  host_name                      = var.backend_host
  http_port                      = 80
  https_port                     = 443
  enabled                        = true
  origin_host_header             = var.backend_host
  priority                       = 1
  weight                         = 1000
  certificate_name_check_enabled = true
}

resource "azurerm_cdn_frontdoor_route" "routing_rule" {
  name                          = var.routing_rule_name
  cdn_frontdoor_endpoint_id     = azurerm_cdn_frontdoor_endpoint.fd.id
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.fd.id
  cdn_frontdoor_origin_ids      = [azurerm_cdn_frontdoor_origin.fd.id]
  supported_protocols           = var.accepted_protocols
  patterns_to_match             = var.patterns_to_match
  forwarding_protocol           = "MatchRequest"
  enabled                       = true
  https_redirect_enabled        = false
  link_to_default_domain        = true
}
