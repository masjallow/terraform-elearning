variable "iam_group_name" {
  type = string
}

variable "iam_user_name" {
  type = string
}

variable "tags" {
  type = object({

    CreatedBy = string
    Environment = string
    Department = string
  })
}

variable "aws_iam_policy_arn" {
  type = string
}