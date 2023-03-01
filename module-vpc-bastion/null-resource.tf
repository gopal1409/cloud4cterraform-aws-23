resource "null_resource" "name" {
  depends_on = [
    module.ec2-public
  ]
  ###first we will create a connection
  connection {
    type="ssh"
    host = aws_eip.bastion_ip.public_ip
    user = "ec2-user"
    password = ""
    private_key = file("private-key/terraform-key.pem")
  }
  ###once connected to ec2 instance i need to traform the pem key to the bastion host
  provisioner "file" {
    source = "private-key/terraform-key.pem"
    destination = "/tmp/terraform-key.pem"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/terraform-key.pem",
      "touch /tmp/hello.txt",
      "echo Hello from null provisione >> hello.txt",
    ]
  }
  provisioner "local-exec" {
    command = "echo vpc created on 'date' and VPC id: ${module.vpc.vpc_id} >> vpc-time.txt"
    working_dir = "local-exec-output-files"
  }
 
}