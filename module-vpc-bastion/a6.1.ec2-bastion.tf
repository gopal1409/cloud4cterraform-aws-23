module "ec2-public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.3.0"

  name = "${var.environment}-BastionHost"
  ami = data.aws_ami.testimage.id
  instance_type = var.instance_type
  key_name = var.instance_keypair
  subnet_id = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.public_bastion_sg.security_group_id]
  tags = local.common_tags
}