module "ec2-private" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.3.0"
depends_on = [
    module.vpc
  ]
  name = "${var.environment}-vm"
  ami = data.aws_ami.testimage.id
  instance_type = var.instance_type
  key_name = var.instance_keypair
  subnet_id = module.vpc.private_subnets[0]
  vpc_security_group_ids = [module.private_sg.security_group_id]
 #instance_count = var.private_instance_count
  user_data = file("${path.module}/app1-install.sh")
  tags = local.common_tags
}