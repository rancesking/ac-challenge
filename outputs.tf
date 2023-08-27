# output "lb_dns_name" {
#   description = "The DNS name of the load balancer"
#   value       = aws_lb.main.dns_name
# }

# output "back_dns_name" {
#   description = "The DNS name of the backend load balancer"
#   value       = aws_lb.back.dns_name
# }

# output "DB_endpoint" {
#   description = "The Endpoint IP of the Postgres RDS"
#   value       = aws_db_instance.default.endpoint
# }

# output "Bastion_endpoint" {
#   description = "The Endpoint IP of the BAstion Hosts"
#   value       = aws_instance.BASTION.public_ip
# }

output "rds_instance_endpoint" {
  value = module.rds.db_endpoint
}

output "rds_instance_user" {
  value = module.rds.db_user
}

output "rds_instance_pass" {
  value = module.rds.db_pass
}


