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
  region = "us-east-1"
}

resource "aws_instance" "ec2demo" {
  ami           = "ami-0557a15b87f6559cf"
  instance_type = "t2.micro"
  tags = {
    Name = "terraform instance"
  }
}

###resource block