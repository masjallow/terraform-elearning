terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.67.0"
    }
  }
}

#data "terraform_remote_state" "remote-state"{
#    backend = "s3"
#
#    config = {
#      bucket = var.remote-backend-bucket
#      key = var.remote-backend-key
#      region = var.region
#    }
#}

