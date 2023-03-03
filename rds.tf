###it will generate an random string with specific length
resource "random_id" "id" {
  byte_length = 8
}
resource "random_password" "db_master_pass" {
  length           = 40
  special          = true
  min_special      = 5
  override_special = "!#$%^&*()-_=+[]{}<>:?"
}
###this resource is going to create only secret manager enable

resource "aws_secretsmanager_secret" "db-pass" {
  name = "db-passs-${random_id.id.hex}"
}
###inside secret manager we are going to add the secret
resource "aws_secretsmanager_secret_version" "db-pass-val" {
  secret_id = aws_secretsmanager_secret.db-pass.id
  secret_string = jsonencode(
    {
      username = aws_rds_cluster.cluster.master_username
      password = aws_rds_cluster.cluster.master_password
      engine   = "mysql"
      host     = aws_rds_cluster.cluster.endpoint
    }
  )

}
###we will create the subnet group
resource "aws_db_subnet_group" "db" {
  ###[*]splat operation in terraform to find our value from a array
  subnet_ids = aws_subnet.db[*].id
}
##3going to create a database
resource "aws_rds_cluster" "cluster" {
  engine                 = "aurora-mysql"
  engine_version         = "5.7.serverless_mysql_aurora.2.08.3"
  engine_mode            = "serverless"
  database_name          = "gopalmydb"
  master_username        = "admin"
  master_password        = random_password.db_master_pass.result
  enable_http_endpoint   = true
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.db.id]
  db_subnet_group_name   = aws_db_subnet_group.db.name
}