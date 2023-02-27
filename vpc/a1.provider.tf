###terraform setting block
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = "~> 4.0"
      #in production always put this version number
    }
  }
}

#provider block
provider "aws" {
  region = var.aws_region
}
