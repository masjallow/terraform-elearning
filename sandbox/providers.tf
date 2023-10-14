terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
    default_tags {
      tags = {
        CostCentre = "888"
        Owner       = "InfraTeam"
      }
    }
  }

terraform {
  backend "s3" {}
}
