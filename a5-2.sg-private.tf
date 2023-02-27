module "private_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.1"
  ###name of the sg need to be changes
  name = "private-sg-gopal"
  vpc_id = module.vpc.vpc_id
  ingress_rules = ["ssh-tcp","http-80-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules = ["all-all"]
  tags = local.common_tags
}