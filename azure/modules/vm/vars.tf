variable "hostname" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "os_disk_size" {
  type = number
  default = 30
}

variable "data_disk_size" {
  type = number
  default = 128
}

variable "data_disk_type" {
  type = string
  default = "Standard_LRS"
}

variable "image" {
  default = {
    offer = "0001-com-ubuntu-server-groovy"
    publisher = "canonical"
    sku = "20_10-gen2"
    version = "latest"
  }
}

variable "username" {
  type = string
  default = "azureuser"
}

variable "security_group" {
}

variable "subnet" {
}

variable "public_ip" {
  type = bool
  default = false
}
