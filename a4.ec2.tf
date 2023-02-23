
##3it will query which az are avaialbe by default
#why we are query using a for_each loop we can deploy an instance on those az 
data "aws_availability_zones" "my_zones" {
   filter {
     name = "opt-in-status"
     values = ["opt-in-not-required"]
   }
}
resource "aws_instance" "name" {
  ami = data.aws_ami.testimage.id
  instance_type = var.instance_type
  user_data = file("${path.module}/app1-install.sh")
  ###any resource which accept multiple values it should inside square bracket or array
  vpc_security_group_ids = [ aws_security_group.vpc-ssh.id,aws_security_group.vpc-http.id ]
  for_each = toset(data.aws_availability_zones.my_zones.names)
  availability_zone = each.key 
  #whole number
  tags = {
    "name" = "instance-${each.value}"
  }
}

/*resource "aws_iam_user" "user" {
  count = length(var.user_name)
  name = var.user_name[count.index]
  #user neo.0 neo.1 neo.2
}*/
/*
resource "aws_iam_user" "user" {
  for_each = toset(var.user_name)
  name = each.value
  #user neo.0 neo.1 neo.2
}
*/