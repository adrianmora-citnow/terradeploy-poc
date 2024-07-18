locals {
  vars        = read_terragrunt_config("../../../env_vars.hcl")
  secret_vars = try(read_terragrunt_config("../../../secret_env_vars.hcl"), { inputs = {} })
}

inputs = merge(
  local.vars.inputs,
  local.secret_vars.inputs,
  {
    region = "eu-central-1"
  }
)

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    encrypt        = true
    bucket         = "am-sandbox-logs-citnow"
    region         = "eu-central-1"
    key            = "${path_relative_to_include()}/terraform.tfstate"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = file("./common/provider.tf")
}

generate "common_variables" {
  path      = "common_variables.tf"
  if_exists = "overwrite"
  contents  = file("./common/common_variables.tf")
}

terraform {
  extra_arguments "bucket" {
    commands = get_terraform_commands_that_need_vars()
    optional_var_files = [
        "${find_in_parent_folders("account.hcl", "ignore")}",
        "${find_in_parent_folders("region.hcl", "ignore")}",
        "${find_in_parent_folders("cin_region.hcl", "ignore")}"
    ]
  }
}