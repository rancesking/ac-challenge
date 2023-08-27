# Terraform Proyect

## Description

This is a Terraform proyect to deploy a AWS infrastructure with ECS, RDS, VPC, ALB and a Bastion Hosts.

## Inputs

| Variable Name | Description | Type | Default | Required |
| --- | --- | --- | --- | --- |
| `region` | Region where the instances be deployed | `string` | `"us-east-1"` | No |
| `env` | Set the desired environment of the infrastructure | `string` | `"dev"` | No |
| `item_count` | Default count used to set AZs and instances | `number` | `2` | No |
| `vpc_cidr` | Default VPC CIDR block | `string` | `"10.0.0.0/16"` | No |
| `availability_zone_names` | List of availability zones | `list(string)` | `["us-east-1a", "us-east-1b"]` | No |
| `web_subnet_cidr` | List of CIDR blocks for web subnets | `list(string)` | `["10.0.1.0/24", "10.0.2.0/24"]` | No |
| `database_subnet_cidr` | List of CIDR blocks for database subnets | `list(string)` | `["10.0.21.0/24", "10.0.22.0/24"]` | No |
| `ecs_cluster_name` | ECS cluster name | `string` | `"Cluster"` | No |
| `ecs_task_execution_role_name` | ECS task execution role name | `string` | `"xmyEcsTaskExecutionRole"` | No |
| `app_image` | Docker image to run in the ECS cluster | `string` | `"xkingrd/littlelink:v33"` | No |
| `lb_port` | Port exposed by the Docker image for load balancing | `number` | `80` | No |
| `app_port` | Port exposed by the Docker image for application | `number` | `80` | No |
| `app_count` | Number of Docker containers to run | `number` | `2` | No |
| `front_health_check_path` | Path for front-end health check | `string` | `"/"` | No |
| `fargate_cpu` | Fargate instance CPU units to provision | `string` | `"256"` | No |
| `fargate_memory` | Fargate instance memory to provision (in MiB) | `string` | `"512"` | No |
| `rds_instance` | Map of RDS instance configuration | `map(any)` | See default value | No |
| `db_user` | User to connect to the database | `string` | `null` | No |
| `db_pass` | User password to connect to the database | `string` | `null` | No |


## Output Variables

| Output Name | Description | Example |
| --- | --- | --- |
| `alb_endpoint` | Application load balance endpoint | `dev-xxxx-lb-xxxxxx.us-east-1.elb.amazonaws.com` |
| `rds_instance_endpoint` | RDS instance endpoint | `acdb-instance.xxxxx.us-east-1.rds.amazonaws.com:5432"` |
| `rds_instance_user` | RDS username | `testing` |
| `rds_instance_pass` | Generated RDS user password | `xxxxxxxxxxxx` |
| `bastion_ip` | Public IP of the bastion host | `54.xxx.3x.235` |
