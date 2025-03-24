resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_container_group" "example" {
  name                = var.container_group_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  os_type             = "Linux"
  ip_address_type     = "Public"
  dns_name_label      = "${var.container_group_name}-dns"

  container {
    name   = var.container_name
    image  = var.image
    cpu    = var.cpu_cores
    memory = var.memory_in_gb

    ports {
      port     = var.port
      protocol = "TCP"
    }
  }

  tags = var.tags
}
