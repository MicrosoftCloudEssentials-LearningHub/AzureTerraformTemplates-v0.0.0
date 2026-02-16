resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "example" {
  name                = var.virtual_network_name
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "example" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_virtual_desktop_workspace" "example" {
  name                = var.workspace_name
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  friendly_name       = "${var.workspace_name} Friendly"
  description         = "${var.workspace_name} Description"
}

resource "azurerm_virtual_desktop_host_pool" "example" {
  name                     = var.host_pool_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  type                     = "Pooled"
  load_balancer_type       = "BreadthFirst"
  preferred_app_group_type = "Desktop"
  friendly_name            = "${var.host_pool_name} Friendly"
  description              = "${var.host_pool_name} Description"
}

resource "azurerm_virtual_desktop_application_group" "example" {
  name                = "${var.host_pool_name}-appgroup"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  host_pool_id        = azurerm_virtual_desktop_host_pool.example.id
  type                = "Desktop"
  friendly_name       = "${var.host_pool_name} App Group"
  description         = "${var.host_pool_name} App Group Description"
}

resource "azurerm_virtual_desktop_workspace_application_group_association" "example" {
  workspace_id         = azurerm_virtual_desktop_workspace.example.id
  application_group_id = azurerm_virtual_desktop_application_group.example.id
}

resource "azurerm_network_interface" "example" {
  count               = 2
  name                = "${var.host_pool_name}-nic-${count.index}"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "example" {
  count                 = 2
  name                  = "${var.host_pool_name}-vm-${count.index}"
  resource_group_name   = azurerm_resource_group.example.name
  location              = azurerm_resource_group.example.location
  size                  = var.vm_size
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  network_interface_ids = [element(azurerm_network_interface.example.*.id, count.index)]

  os_disk {
    name                 = "${var.host_pool_name}-osdisk-${count.index}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  tags = var.tags
}
