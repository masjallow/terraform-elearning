output "s3-arn" {
    value = aws_s3_bucket.s3_bucket.arn
  
}

# output "backend-bucket-name" {
#     value = data.terraform_remote_state.remote-state.name
# }