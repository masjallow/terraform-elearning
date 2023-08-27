output "s3-bucket-name" {
  value = module.creative-dev-s3-bucket.s3-arn
}
//
//output "database-address" {
//  value = module.rds-db.address
//}
//
//output "database-port"{
//  value = module.rds-db.port
//}
//
//output "webserver-address" {
//  value = module.webserver.alb_dns_name
//}
//
//output "webserver-asg-name" {
//  value = module.webserver.asg_name
//}

output "user_arn" {
  value = module.task2.iam_user_arn
}

output "group_arn" {
  value = module.task2.iam_group_arn
}

output "policy_arn" {
  value = module.task2.iam_policy_arn
}