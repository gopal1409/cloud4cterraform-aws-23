resource "aws_instance" "ec2demo1" {
  ami           = "ami-0557a15b87f6559cf"
  instance_type = "t2.micro"
  user_data = file("${path.module}/app-install.sh")
  tags = {
    Name = "terraform gopal user script"
  }
}
