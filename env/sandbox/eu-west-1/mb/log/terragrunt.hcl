include {
  path = find_in_parent_folders()
}

terraform {
  source = "git::git@github.com:adrianmora-citnow/terraform_modules-poc.git//log?ref=update_module"
}
