resource "azurerm_public_ip" "main" {
  count               = var.public_ip ? 1 : 0
  name                = "${var.hostname}-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "main" {
  name                = "${var.hostname}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name              = "${var.hostname}-ipconfig"
    subnet_id         = jsondecode(var.subnet).id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip ? azurerm_public_ip.main[0].id : null
  }
}

resource "azurerm_network_interface_security_group_association" "main" {
  network_interface_id      = azurerm_network_interface.main.id
  network_security_group_id = jsondecode(var.security_group).id
}
