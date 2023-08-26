resource "aws_db_instance" "creative-db" {
  identifier_prefix   = "terraform-up-and-running"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"
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