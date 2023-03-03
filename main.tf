resource "aws_instance" "example" {
  ami = "ami-0557a15b87f6559cf"
  instance_type = "t2.micro" 
  vpc_security_group_ids = [aws_security_group.instance.id ]
  user_data = <<EOF
  #!/bin/bash 
  sudo apt-get update -y
  sudo apt install apache2 -y
  echo "Hello,World" > /var/www/html/index.html
  EOF
}

resource "aws_security_group" "instance" {
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "public_ip" {
  value = aws_instance.example.public_ip
}