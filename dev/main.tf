data "aws_caller_identity" "current" {}

data "aws_region" "current" {}


locals {
    tags = {
        CreatedBy = "Jallow"
        Environment = "dev"
        Department = "infrastructure"
    }
    
    }


module "creative-dev-s3-bucket" {
    source = "../terraform-modules/s3"
    s3-bucket-name= "${data.aws_caller_identity.current.account_id}-${data.aws_region.current.name}-test-${var.environment}"
    tags = local.tags
}

variable "environment" {
    default  = "sandbox"
    type = string
}

#290668402712-us-east-1-terraform-remote-state