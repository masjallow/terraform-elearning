
resource "aws_s3_bucket" "s3_bucket" {
    bucket = var.s3-bucket-name


  tags = {
    CreatedBy = var.tags.CreatedBy
    Environment = var.tags.Environment
    Department = var.tags.Department
  }
}
