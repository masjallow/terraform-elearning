


resource "aws_s3_bucket" "s3_bucket" {
    bucket = var.s3-bucket-name


  tags = {
    CreatedBy = var.tags.CreatedBy
    Environment = var.tags.Environment
    Department = var.tags.Department
  }
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}