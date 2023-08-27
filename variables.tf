variable "region" {
  description = "Set the desired region of the infrastructure"
  type        = string
  default     = "us-east-1"
}

variable "env" {
  description = "Set the desired enviroment of the infrastructure"
  type        = string
  default     = "dev"
}

#Count variable
variable "item_count" {
  description = "default count used to set AZs and instances"
  type        = number
  default     = "2"
}

#VPC variables
variable "vpc_cidr" {
  description = "default vpc cidr block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zone_names" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "web_subnet_cidr" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "database_subnet_cidr" {
  type    = list(string)
  default = ["10.0.21.0/24", "10.0.22.0/24"]
}

#ECS variables
variable "ecs_cluster_name" {
  description = "ECS task execution role name"
  default     = "Cluster"
}

variable "ecs_task_execution_role_name" {
  description = "ECS task execution role name"
  default     = "xmyEcsTaskExecutionRole"
}

variable "app_image" {
  description = "Docker image to run in the ECS cluster"
  default     = "xkingrd/littlelink:v33"
}

variable "lb_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 80
}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 80
}

variable "app_count" {
  description = "Number of docker containers to run"
  default     = 2
}

variable "front_health_check_path" {
  default = "/"
}

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "256"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "512"
}

#Create database variables
variable "rds_instance" {
  type = map(any)
  default = {
    allocated_storage   = 5
    engine              = "postgres"
    engine_version      = "14.1"
    instance_class      = "db.t4g.micro"
    multi_az            = false
    name                = "challenge_db"
    skip_final_snapshot = true
    db_name             = "my_db"
  }
}

variable "db_user" {
  description = "Set the user to connect to the db"
  type        = string
  default     = null
  sensitive   = true
}

variable "db_pass" {
  description = "Set the user password to connect to the db"
  type        = string
  default     = null
  sensitive   = true
}