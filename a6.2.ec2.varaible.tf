variable "instance_keypair" {
  type=string
  default = "terraform-key"
}

variable "private_instance_count" {
  type=number
  default=1
}