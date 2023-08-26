data "aws_caller_identity" "current" {}

data "aws_region" "current" {}


locals {
  tags = {
    CreatedBy = "Varun"
    Environment = "nonprod"
    Department = "platform"
  }

}


module "creative-dev-s3-bucket" {
  source = "../terraform-modules/s3"
  s3-bucket-name= "${data.aws_caller_identity.current.account_id}-${data.aws_region.current.name}-creative-${var.environment}"
  tags = local.tags
}