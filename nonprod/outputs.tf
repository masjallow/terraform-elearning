output "s3-bucket-name" {
  value = module.creative-dev-s3-bucket.s3-arn
}

output "database-address" {
  value = module.rds-db.address
}

output "database-port" {
  value = module.rds-db.port
}