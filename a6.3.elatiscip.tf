resource "aws_eip" "bastion_ip" {
  depends_on = [
    module.ec2-public,module.vpc
  ]
  instance = module.ec2-public.id
  vpc = true 
  tags = local.common_tags
}