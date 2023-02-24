resource "aws_vpc" "main" {
  name = var.myvpc
  cidr_block = "10.0.0.0/16"
}