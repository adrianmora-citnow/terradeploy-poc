include {
  path = find_in_parent_folders()
}

terraform {
  #source = "../../../modules//sg"
  source = "git::git@github.com:adrianmora-citnow/terraform_modules-poc.git//sg?ref=1.0.1"
}
