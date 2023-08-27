output "alb_endpoint" {
  description = "Application loadbalance endpoint for the ECS cluster"
  value       = module.vpc.alb_endpoint
}
output "rds_instance_endpoint" {
  description = "RDS instance endpoint"
  value       = module.rds.db_endpoint
}

output "rds_instance_user" {
  description = "RDS username"
  value       = module.rds.db_user
}

output "rds_instance_pass" {
  description = "Generated RDS user password"
  value       = module.rds.db_pass
}

output "bastion_ip" {
  description = "Public IP of the bastion host"
  value       = module.bastion.bastion_ip
}


