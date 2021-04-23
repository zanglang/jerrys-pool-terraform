locals {
  resource_group_name   = "azure-node-1"
  location              = "East US"

  subscription_id       = "4b9bbe48-7f21-44dd-b77b-521beb3e5c19"
  tenant_id             = "f9ef8095-3df4-47f8-9d38-7da10267190b"

  vnet_address_space    = "10.0.2.0/24"
  subnet_address_prefixes = "10.0.2.0/24"
}
