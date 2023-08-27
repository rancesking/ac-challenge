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

variable "subnet" {
  description = "subnet where the RDS runs imported from vpc module"
}

variable "sg" {
  description = "security group allowing port 5432 to the RDS instance imported from vpc module"
}

variable "rds_name" {
  description = "Name of the RDS Instance"
  default = "rds-instance"
}

variable "rds_instance" {
  type    = map(any)
    default = {
    allocated_storage   = 5
    engine              = "postgres"
    engine_version      = "15.3"
    instance_class      = "db.t4g.micro"
    multi_az            = false
    name                = "db"
    skip_final_snapshot = true
    db_name             = "my_db"
  }
}

variable "db_name" {
  type = string
  default = "db"  
}

variable "db_user" {
  type = string
  default = "user"  
}