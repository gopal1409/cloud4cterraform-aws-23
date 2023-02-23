resource "aws_instance" "name" {
  ami = data.aws_ami.testimage.id
  instance_type = var.instance_type
  ###any resource which accept multiple values it should inside square bracket or array
  vpc_security_group_ids = [ aws_security_group.vpc-ssh.id,aws_security_group.vpc-http.id ]
  tags = {
    "name" = "ec2-gopal"
  }
}