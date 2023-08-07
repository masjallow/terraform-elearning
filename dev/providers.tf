terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.67.0"
    }
  }
  backend "s3" {
    bucket = "385078676943-us-east-1-terraform-remote-state"
    key = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
#  profile = "Sandbox"
  region = "us-east-1"
}