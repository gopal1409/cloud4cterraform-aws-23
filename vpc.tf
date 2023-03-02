resource "aws_vpc" "db" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true 
}
data "aws_availability_zones" "available" {
    state = "available"
}

resource "aws_subnet" "db" {
  count = 2
  vpc_id = aws_vpc.db.id
  ###cidrsubnet it is a function in terraform to create multiple subnet using index
  cidr_block = cidrsubnet(aws_vpc.db.cidr_block,8,count.index)
  ###below line will ensure that the subnet are create only in az which is avaialbe state
  availability_zone = data.aws_availability_zones.available.names[count.index]
}

resource "aws_security_group" "db" {
  vpc_id = aws_vpc.db.id 
  ingress   {
    cidr_blocks = [ aws_vpc.db.cidr_block ]
    from_port = 0
    to_port = 0
    protocol = "-1"
    
  } 
  egress  {
    cidr_blocks = [ aws_vpc.db.cidr_block ]
    from_port = 0
    to_port = 0
    protocol = "-1"
    
  }
}