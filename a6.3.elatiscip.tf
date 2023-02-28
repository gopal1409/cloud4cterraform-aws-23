resource "aws_eip" "bastion_ip" {
  depends_on = [
    module.ec2-public,module.vpc
  ]
  instance = module.ec2-public.id
  vpc = true 
  tags = local.common_tags
   provisioner "local-exec" {
   
    command = "echo eip destroyed on 'date'  >> destroytime.txt"
    working_dir = "local-exec-output-files"
    when=destroy
  }
}