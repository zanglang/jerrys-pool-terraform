locals {
  common_vars = read_terragrunt_config(find_in_parent_folders("common.hcl"))
}

generate "common_variables" {
  path = "common_variables.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
%{ for key, value in local.common_vars.locals ~}
variable "${key}" {
  default = "${value}"
}
%{ endfor ~}
EOF
}

inputs = merge(
  local.common_vars.locals,
)

generate "azure" {
  path = "azure.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  tenant_id = "${local.common_vars.locals.tenant_id}"
}
EOF
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.56.0"
    }
  }
}
EOF
}

