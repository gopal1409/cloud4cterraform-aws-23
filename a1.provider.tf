###terraform setting block
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = "~> 4.0"
      #in production always put this version number
    }
    ###adding backend as s3 for remote state storage
    
    null = {
      source = "hashicorp/null"
    }
    
  }
  ####
  backend "s3" {
      bucket = "terraform-on-aws-for-elb-gopal"
      key = "terraform.tfstate"
      region = "us-east-1"
      dynamodb_table= "dev-project1-vpc"
    }
}

#provider block
provider "aws" {
  region = var.aws_region
}
