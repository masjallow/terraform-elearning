resource "aws_iam_group" "iam_group" {
  name = var.iam_group_name
}

resource "aws_iam_user" "iam_user" {
  name = var.iam_user_name
  force_destroy = true

  tags = {
    CreatedBy = var.tags.CreatedBy
    Environment = var.tags.Environment
    Department = var.tags.Department
  }
}

#arn:aws:iam::aws:policy/AdministratorAccess
resource "aws_iam_group_policy_attachment" "test-attach" {
  group      = aws_iam_group.iam_group.name
  policy_arn = var. aws_iam_policy_arn
}

resource "aws_iam_user_group_membership" "group_membership" {
  user = aws_iam_user.iam_user.name

  groups = [
    aws_iam_group.iam_group.name
  ]
}