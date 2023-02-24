data "aws_ec2_instance_type_offering" "my_inst_type" {
  filter {
    name = "instance-type"
    values = [ "t3.micro" ]
  }
  filter {
    name = "location"
    #values = ["us-east-1e"]
    values = ["us-east-1a"]
  }
  location_type = "availability-zone"
}

output "output_v1_1" {
  value = data.aws_ec2_instance_type_offering.my_inst_type.instance_type
}