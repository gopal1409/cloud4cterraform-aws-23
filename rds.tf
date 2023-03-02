resource "random_id" "id" {
    byte_length = 8
}
resource "random_password" "db_master_pass" {
  length = 40 
  special = true 
  min_special = 5 
  override_special ="!#$%^&*()-_=+[]{}<>:?"
}

resource "aws_secretsmanager_secret" "db-pass" {
    name = "db-pass-${random_id.id.hex}" 
}