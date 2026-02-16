# main.tf
# This file contains the main configuration for creating the Azure Load Balancer and its associated resources.

# Resource Group for Load Balancer
resource "azurerm_resource_group" "lb" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

# Public IP for Load Balancer
resource "azurerm_public_ip" "lb" {
  name                = var.public_ip_name
  location            = azurerm_resource_group.lb.location
  resource_group_name = azurerm_resource_group.lb.name
  allocation_method   = "Static"
  sku                 = var.lb_sku
  tags                = var.tags
}

# Azure Load Balancer
resource "azurerm_lb" "lb" {
  name                = var.load_balancer_name
  location            = azurerm_resource_group.lb.location
  resource_group_name = azurerm_resource_group.lb.name
  sku                 = var.lb_sku

  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.lb.id
  }

  tags = var.tags
}

# Backend Address Pool for Load Balancer
resource "azurerm_lb_backend_address_pool" "lb" {
  name            = var.backend_pool_name
  loadbalancer_id = azurerm_lb.lb.id
}

# Health Probe for Load Balancer
resource "azurerm_lb_probe" "lb" {
  name                = var.health_probe_name
  loadbalancer_id     = azurerm_lb.lb.id
  protocol            = var.probe_protocol
  port                = var.probe_port
  interval_in_seconds = 15
  number_of_probes    = 2
}

# Load Balancer Rule
resource "azurerm_lb_rule" "lb" {
  name                           = var.lb_rule_name
  loadbalancer_id                = azurerm_lb.lb.id
  protocol                       = "Tcp"
  frontend_port                  = var.frontend_port
  backend_port                   = var.backend_port
  frontend_ip_configuration_name = var.frontend_ip_configuration_name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.lb.id]
  probe_id                       = azurerm_lb_probe.lb.id
  enable_floating_ip             = false
  idle_timeout_in_minutes        = 4
}
