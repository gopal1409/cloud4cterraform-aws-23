####terraform has create a block called as local block
locals {
    #how do we concatinate this varaible
    #we created a key and call the varAbile
  owners=var.business_devision
  environment = var.environment
  name = "${var.business_devision}-${var.environment}"
  ###
  #name=dev-sap
  common_tags = {
    owners = local.owners
    environment = local.environment
  }
}