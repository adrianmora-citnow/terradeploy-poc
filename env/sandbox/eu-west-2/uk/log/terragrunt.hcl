include {
  path = find_in_parent_folders()
}

terraform {
  source = "git::git@github.com:adrianmora-citnow/terraform_modules-poc.git//log?ref=1.0.1"
}

