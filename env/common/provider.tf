terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.1"
    }
  }
  required_version = ">= 1.4.2"
}

provider "aws" {
  region              = var.region
  allowed_account_ids = [var.account_id]
}