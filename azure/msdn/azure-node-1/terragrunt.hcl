include {
  path = "${find_in_parent_folders()}"
}

dependency "common" {
  config_path = "..//common"
}

terraform {
  source = "../../modules//vm"
}

inputs = {
  hostname = "azure-node-1"
  vm_size = "Standard_F2s_v2"
  os_disk_size = "30"
  data_disk_size = "128"
  data_size_type = "Premium_LRS"
  public_ip = true

  resource_group = dependency.common.outputs.resource_group
  subnet = dependency.common.outputs.subnet
  security_group = dependency.common.outputs.security_group
}
