data "aws_caller_identity" "current" {}

data "aws_region" "current" {}


locals {
    tags = {
        CreatedBy = "Jallow"
        Environment = "dev"
        Department = "infrastructure"
    }
    
    }

module "task2" {
    source = "../terraform-modules/IAM"
    aws_iam_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
    iam_group_name = "devops"
    iam_user_name = "alice"
    tags = local.tags
}


module "creative-dev-s3-bucket" {
    source = "../terraform-modules/s3"
    s3-bucket-name= "${data.aws_caller_identity.current.account_id}-${data.aws_region.current.name}-test-${var.environment}"
    tags = local.tags
}

//module "rds-db" {
//    source = "../terraform-modules/RDS"
//
//    db_password = "root$$123"
//    db_username = "root"
//    tags        = local.tags
//    db_name     = "${var.environment}DB"
//    db_engine = ""
//    db_storage = ""
//}

//module "webserver" {
//    source = "../terraform-modules/webserver"
//    cluster_name = "webserver"
//    db_remote_state_bucket = "385078676943-us-east-1-terraform-remote-state"
//    db_remote_state_key = "dev/terraform.tfstate"
//    image_id = "ami-051f7e7f6c2f40dc1"
//    instance_type = "t2.micro"
//    max_size = 2
//    min_size = 1
//    tags = local.tags
//}

variable "environment" {
    default  = "sandbox"
    type = string
}

#290668402712-us-east-1-terraform-remote-state