
locals {
  tag = {
    "Name" : "sftp"
    "CreatedBy" : "Jallow"
    "Environment" : "prod"
  }
}


module "ec2-server" {
  source = "../terraform-module/EC2"
  tags = local.tag
  instance_type = "t2.small"
}