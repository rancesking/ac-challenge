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

variable "lb_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 80
}

variable "vs_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 8080
}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 80
}

variable "front_health_check_path" {
  default = "/"
}

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
