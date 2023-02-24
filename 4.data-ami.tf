#this data source block will query the ami as per the region you specified in provider file
data "aws_ami" "testimage" {
  
  most_recent      = true
  
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name = "architecture"
    values=["x86_64"]
  }
}