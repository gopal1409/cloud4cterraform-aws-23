resource "aws_instance" "name" {
  ami = data.aws_ami.testimage.id
  instance_type = var.instance_type
  user_data = file("${path.module}/app1-install.sh")
  ###any resource which accept multiple values it should inside square bracket or array
  vpc_security_group_ids = [ aws_security_group.vpc-ssh.id,aws_security_group.vpc-http.id ]
  count = 2
  #whole number
  tags = {
    "name" = "Count-Demo-${count.index}"
  }
}

resource "aws_iam_user" "user" {
  count = length(var.user_name)
  name = var.user_name[count.index]
  #user neo.0 neo.1 neo.2
}
