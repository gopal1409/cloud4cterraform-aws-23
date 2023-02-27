output "vpc_id" {
  description = "The id of vpc"
  value = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "The id of vpc"
  value = module.vpc.vpc_cidr_block
}