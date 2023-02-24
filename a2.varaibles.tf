variable "aws_region" {
  description = "Region in which aws resource need to be created"
  type = string
  #you can have type as string numeric and list
  default="us-east-1"
}
variable "environment" {
  description = "Evironemt varaible used as prefix"
  type = string 
  default = "dev"
}
variable "business_devision" {
  description = "business devision"
  type=string 
  default = "sap"
}
variable "instance_type" {
  type=string 
  default="t2.micro"
}

variable "user_name" {
  type = list(string)
  default = [ "darth","yoda" ]
 # key = value
}
