data "aws_caller_identity" "current" {}

data "aws_region" "current" {}


locals {
  tags = {
    CreatedBy = "Jallow"
    Environment = "nonprod"
    Department = "platform"
  }

}


module "creative-dev-s3-bucket" {
  source = "../terraform-modules/s3"
  s3-bucket-name= "${data.aws_caller_identity.current.account_id}-${data.aws_region.current.name}-creative-${var.environment}"
  tags = local.tags
}

module "rds-db" {
    source = "../terraform-modules/RDS"

    db_password = "HelloWorld$1"
    db_username = "creative"
    tags        = local.tags
    db_name     = "${var.environment}DB"
    db_engine = "postgres"
    db_storage = "20"
    public_access = true
}

//module "webserver" {
//    source = "../terraform-modules/webserver"
//    cluster_name = "webserver"
//    db_remote_state_bucket = "385078676943-us-east-1-terraform-remote-state"
//    db_remote_state_key = "nonprod/terraform.tfstate"
//    image_id = "ami-051f7e7f6c2f40dc1"
//    instance_type = "t2.micro"
//    max_size = 2
//    min_size = 1
//    tags = local.tags
//}