
locals {
  tag = {
    "Name" : "test-server"
    "CreatedBy" : "Jallow"
    "Environment" : "Dev"
  }
}


#module "ec2-server" {
#  source = "../terraform-module/EC2"
#  tags = local.tag
#}

variable "names" {
  type = list(string)
  default = ["neo","morpheus"]
}
#resource "aws_iam_user" "example" {
#  count = length(var.names)
#  name = var.names[count.index]
#}
#
#output "iam_names" {
#  value = aws_iam_user.example[*].arn
#}

#//example 1
#variable "usernames" {
#  default = ["zoo","planet","ghost"]
#}
#module "iam-module" {
#  source = "../terraform-module/IAM"
#  count = length(var.usernames)
#  names  = var.usernames[count.index]
#}
#
#//example 2
#module "iam-module-prod" {
#  source = "../terraform-module/IAM"
#  names = "zoombie"
#}

//example1 for-each

#resource "aws_iam_user" "example" {
#  for_each = toset(var.names)
#  name = each.key
#}
#
#//eaxmple2 for-each
#// mark,pat,brad,kevin
#
#variable "for_each_example2" {
#  type = list(string)
#  default = ["mark","pat","brad","kevin"]
#}
#
#resource "aws_iam_user" "example2" {
#  for_each = toset(var.for_each_example2)
#  name = each.key
#}
#output "example2" {
#  value = values(aws_iam_user.example2)[*].arn
#}
#
#//For-expressions
#variable "for_each_example3" {
#  type = list(string)
#  default = ["mark","pat","brad","kevin"]
#}
#
#output "for_expression_ex1_output" {
#  value = [for item in var.for_each_example3 : upper(item)]
#}
#
#// for-expression example2
#
#variable "map_movies" {
#  type = map(any)
#  default = {
#    Movie = "titanic"
#    director = "james cameroon"
#    release_year = 1991
#  }
#}
#
#output "for_expression_example2" {
#  value = { for key,value in var.map_movies : upper(key) => upper(value)}
#}
#
#//string directive example1
#
#variable "string_directive_exampl1" {
#  type =  list(string)
#  default = ["neo", "trinity","morpheus"]
#}
#output "string_directive_exampl1_output" {
#  value = "%{ for name in var.string_directive_exampl1 }${upper(name)},%{ endfor }"
#}
#output "string_directive_exampl2_output" {
#  value = "%{ for index,name in var.string_directive_exampl1 }(${index})-${upper(name)},%{ endfor }"
#}
#
#output "for_directive_index_if"{
#  value = <<EOF
#%{ for name in var.string_directive_exampl1}
#${name}%{if length(name)<3}, %{endif}
#%{endfor}
#EOF
#}
#
#
#
#
#// if statement example with count parameter
#
#variable "create_s3_bucket"{
#  type = bool
#  default = false
#}
#
#resource "aws_s3_bucket" "s3_bucket_example" {
#  count = var.create_s3_bucket ? 1 : 0
#  bucket = "my-tf-test-bucket"
#}



data "aws_caller_identity" "self" {}

data "aws_iam_policy_document" "cmk_admin_policy"{
  statement {
    effect = "Allow"
    resources = ["*"]
    actions = ["kms:*"]
    principals {
      identifiers = [data.aws_caller_identity.self.arn]
      type        = "AWS"
    }
  }
}

resource "aws_kms_key" "cmk" {
  policy = data.aws_iam_policy_document.cmk_admin_policy.json
}

resource "aws_kms_alias" "cmk_alias" {
  target_key_id = aws_kms_key.cmk.id
  name = "alias/kms-cmk-example"
}

data "aws_kms_secrets" "creds" {
  secret {
    name    = "db"
    payload = file("${path.module}/db-creds.yml.encrypted")
  }
}

locals {
  db_creds = yamldecode(data.aws_kms_secrets.creds.plaintext["db"])
}

data "aws_secretsmanager_secret" "example" {
  arn = "arn:aws:secretsmanager:us-east-1:385078676943:secret:prod/mysql-YS0iTU"
}

data "aws_secretsmanager_secret_version" "secret-version" {
  secret_id = data.aws_secretsmanager_secret.example.id
}

resource "aws_db_instance" "example" {
  identifier_prefix   = "terraform-up-and-running"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"
  skip_final_snapshot = true
  db_name             = "abc"

  # DO NOT DO THIS!!!
  username = jsondecode(data.aws_secretsmanager_secret_version.secret-version.secret_string)["username"]
  password = jsondecode(data.aws_secretsmanager_secret_version.secret-version.secret_string)["password"]
  # DO NOT DO THIS!!!
}

