variable "region" {
  description = "Set the desired region of the infrastructure"
  type        = string
  default     = "us-east-1"
}

variable "env" {
  description = "Set the desired enviroment of the infrastructure"
  type        = string
  default = "dev"
}

variable "item_count" {
  description = "default count used to set AZs and instances"
  type        = number
  default = 2
}

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

variable "subnet" {
  description = "subnet where the ecs task runs imported from vpc module"
}

variable "sg" {
  description = "segurity group allowing port 80 to the ecs cluster imported from vpc module"
}

variable "tg" {
  description = "target group for the ecs cluster imported from vpc module"
}

variable "listener" {
  description = "listerner of thetarget group for the ecs cluster imported from vpc module"
}