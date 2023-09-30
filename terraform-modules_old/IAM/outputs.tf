output "iam_group_arn" {
  value = aws_iam_group.iam_group.arn
}

output "iam_user_arn" {
  value = aws_iam_user.iam_user.arn
}

output "iam_policy_arn" {
  value = aws_iam_group_policy_attachment.test-attach.policy_arn
}