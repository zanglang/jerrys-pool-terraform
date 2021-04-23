output "resource_group" {
  value = azurerm_resource_group.main
}

output "subnet" {
  value = azurerm_subnet.main
}

output "security_group" {
  value = azurerm_network_security_group.sg
}
