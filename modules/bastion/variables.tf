variable "env" {
  description = "Set the desired enviroment of the infrastructure"
  type        = string
  default     = "dev"
}

variable "instance_type" {
  description = "Set the instance type for the bastion host"
  type        = string
  default     = "t4g.nano"
}

variable "instance_ami" {
  description = "Set the instance OS for the bastion host"
  type        = string
  default     = "ami-0b9ce70cf1bc24fc3"
}

variable "subnet" {
  description = "subnet where the Bastion instance runs imported from vpc module"
}

variable "sg" {
  description = "security group allowing port 5432 from the bastion host to the RDS instance imported from vpc module"
}