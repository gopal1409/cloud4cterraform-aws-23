###terraform setting block
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = "~> 4.0"
      #in production always put this version number
    }
    ###adding backend as s3 for remote state storage
    random = {
      source = "hashicorp/random"
    }
    null = {
      source = "hashicorp/null"
    }


  }
  ####

}

#provider block
provider "aws" {
  region = var.aws_region
}
resource "aws_instance" "example" {
  ami = "ami-0557a15b87f6559cf"
  instance_type = "t2.micro" 
  vpc_security_group_ids = [aws_security_group.instance.id ]
  user_data = <<EOF
#!/bin/bash
echo "Hello, World!" > index.html
nohup busybox httpd -f -p 8080 &
EOF
}

resource "aws_security_group" "instance" {
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "public_ip" {
  value = aws_instance.example.public_ip
}