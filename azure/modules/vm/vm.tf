resource "azurerm_virtual_machine" "main" {
  name                  = var.hostname
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = var.vm_size

  os_profile {
    computer_name  = var.hostname
    admin_username = var.username
  }

  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      key_data = file("~/.ssh/id_rsa.pub")
      path     = "/home/${var.username}/.ssh/authorized_keys"
    }
  }

  storage_image_reference {
    publisher = var.image.publisher
    offer     = var.image.offer
    sku       = var.image.sku
    version   = var.image.version
  }

  storage_os_disk {
    name              = "${var.hostname}-os"
    disk_size_gb      = var.os_disk_size
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_data_disk {
    name              = "${var.hostname}-data"
    lun               = 0
    create_option     = "Empty"
    disk_size_gb      = var.data_disk_size
    managed_disk_type = var.data_disk_type
  }
}

