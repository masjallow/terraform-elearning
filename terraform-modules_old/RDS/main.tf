resource "aws_db_instance" "creative-db" {
  identifier_prefix   = "terraform-up-and-running"
  engine              = var.db_engine
  allocated_storage   = var.db_storage
  instance_class      = "db.m5d.large"
  publicly_accessible = var.public_access
  db_name             = var.db_name
  username            = var.db_username
  password            = var.db_password
  skip_final_snapshot = true
  tags = {
    CreatedBy = var.tags.CreatedBy
    Environment = var.tags.Environment
    Department = var.tags.Department
  }
}
