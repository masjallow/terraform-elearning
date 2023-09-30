
locals {
  tag = {
    "Name" : "test-server"
    "CreatedBy" : "Jallow"
    "Environment" : "Dev"
  }
}


module "ec2-server" {
  source = "../terraform-module/EC2"
  tags = local.tag
}