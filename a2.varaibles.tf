variable "aws_region" {
  description = "Region in which aws resource need to be created"
  type = string
  #you can have type as string numeric and list
  default="us-east-1"
}

variable "instance_type" {
  type=string 
  default="t2.micro"
}
