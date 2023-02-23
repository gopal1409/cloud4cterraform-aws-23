###creation the block is resource
#what type of resource i want to create
resource "aws_instance" "ec2demo" {
  ami           = "ami-0557a15b87f6559cf"
  #we have hardcoded our ami value. 
  instance_type = "t2.micro"
  tags = {
    Name = "terraform gopal"
  }
}

###resource block