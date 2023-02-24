#why we are query using a for_each loop we can deploy an instance on those az 
data "aws_availability_zones" "my_zones" {
   filter {
     name = "opt-in-status"
     values = ["opt-in-not-required"]
   }
}
data "aws_ec2_instance_type_offerings" "my_ins_type" {
    ##using for_each and toset like a list of items list of az it is going to find out
  for_each = toset(data.aws_availability_zones.my_zones.names)
  filter {
    name = "instance-type"
    values = [ "t3.micro" ]
  }
  filter {
    name = "location"
    values = [each.key]
  }
  location_type = "availability-zone"
}

###i just want to display only those az which support my instance type
output "output_v3_2" {
  value = {
    for az, details in data.aws_ec2_instance_type_offerings.my_ins_type: 
    az => details.instance_types if length(details.instance_types) != 0 }
}

# Output-3
# Filtered Output: with Keys Function - Which gets keys from a Map
# This will return the list of availability zones supported for a instance type
output "output_v3_3" {
  value = keys({for az, details in data.aws_ec2_instance_type_offerings.my_ins_type: 
    az => details.instance_types if length(details.instance_types) != 0 })
}