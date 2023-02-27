variable "vpc_name" {
  type = string 
  default = "myvpc"
}

variable "vpc_cidr_block" {
  type = string
  default="10.0.0.0/16"
}

variable "vpc_availability_zone" {
  type=list(string)
  default = [ "us-east-1a", "us-east-1b"]
}

variable "public_subent" {
  type=list(string)
  default = [ "10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  type=list(string)
  default = [ "10.0.3.0/24", "10.0.4.0/24"]
}

variable "database_subnet" {
  type=list(string)
  default = [ "10.0.5.0/24", "10.0.6.0/24"]
}

variable "db_group_subnet" {
  type = bool 
  default=true
}

variable "rtb_for_db_subnet" {
  type = bool 
  default = true
}

variable "vpc_enable_nat_gateway" {
  type = bool
  default=true
}

variable "vpc_single_nat_gateway" {
  type = bool 
  default=true
}