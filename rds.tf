resource "aws_db_instance" "rds-instance" {
  allocated_storage    = 10
  db_name              = "mydbgopal"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "gopal"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}