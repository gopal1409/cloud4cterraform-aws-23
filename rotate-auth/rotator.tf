resource "aws_secretsmanager_secret_rotation" "rotation" {
  secret_id = aws_secretsmanager_secret_version.db-pass-val.secret_id
  rotation_lambda_arn =  aws_serverlessapplicationrepository_cloudformation_stack.rotation-stack.outputs.RotationLambdaARN
  rotation_rules {
    automatically_after_days = 15
  }
}

resource "aws_vpc_endpoint" "secretmanager" {
  vpc_id = aws_vpc.db.id 
  service_name = "com.amazonaws.${data.aws_region.current.name}.secretsmanager"
  vpc_endpoint_type = "Interface"
  private_dns_enabled = true 
  subnet_ids = [aws_subnet.db[0].id]
  security_group_ids = [aws_security_group.db.id]
}
data "aws_serverlessapplicationrepository_application" "rotator" {
  application_id = "arn:aws:serverlessrepo:us-east-1:297356227824:applications/SecretsManagerRDSMySQLRotationSingleUser"
}

data "aws_partition" "current" {}
data "aws_region" "current" {}

resource "aws_serverlessapplicationrepository_cloudformation_stack" "rotation-stack" {
  name = "Rotate-${random_id.id.hex}"
  application_id = data.aws_serverlessapplicationrepository_application.rotator.application_id
  semantic_version = data.aws_serverlessapplicationrepository_application.rotator.semantic_version
  capabilities = data.aws_serverlessapplicationrepository_application.rotator.required_capabilities
  parameters = {
    endpoint            = "https://secretsmanager.${data.aws_region.current.name}.${data.aws_partition.current.dns_suffix}"
    functionName        = "rotator-${random_id.id.hex}"
    vpcSubnetIds        = aws_subnet.db[0].id
    vpcSecurityGroupIds = aws_security_group.db.id
  }
}