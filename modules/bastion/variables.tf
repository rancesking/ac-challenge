variable "env" {
  description = "Set the desired enviroment of the infrastructure"
  type        = string
  default     = "dev"
}

variable "instance_type" {
  description = "Set the instance type for the bastion host"
  type        = string
  default     = "t2.micro"
}

variable "instance_ami" {
  description = "Set the instance OS for the bastion host"
  type        = string
  default     = "ami-0cff7528ff583bf9a"
}

variable "subnet" {
  description = "subnet where the Bastion instance runs imported from vpc module"
}

variable "sg" {
  description = "security group allowing port 5432 from the bastion host to the RDS instance imported from vpc module"
}