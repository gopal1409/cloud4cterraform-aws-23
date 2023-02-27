module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"
  
  #what are the argument this module block accept as input
  name = "${local.name}-${var.vpc_name}"
  cidr = var.vpc_cidr_block
  azs = var.vpc_availability_zone
  private_subnets = var.private_subnets
  public_subnets = var.public_subent
  database_subnets = var.database_subnet

  create_database_subnet_group = var.db_group_subnet
  create_database_subnet_route_table = var.rtb_for_db_subnet

  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway

  enable_dns_hostnames = true 
  enable_dns_support = true 

  tags = local.common_tags
}

