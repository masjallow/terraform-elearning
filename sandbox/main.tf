
locals {
  tag = {
    "Name" : "test-server"
    "CreatedBy" : "Jallow"
    "Environment" : "sandbox"
  }
}


module "ec2-server" {
  source = "../terraform-module/EC2"
  tags = local.tag
  instance_type = variable.instance_type
}

variable "instance_type"{}