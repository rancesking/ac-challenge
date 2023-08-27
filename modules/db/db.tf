resource "random_password" "pw" {
  length  = 16
  special = false
}

#Create database
resource "aws_db_instance" "default" {
  allocated_storage      = var.rds_instance.allocated_storage
  db_subnet_group_name   = aws_db_subnet_group.default.id
  engine                 = var.rds_instance.engine
  engine_version         = var.rds_instance.engine_version
  instance_class         = var.rds_instance.instance_class
  multi_az               = var.rds_instance.multi_az
  db_name                = var.db_name
  identifier             = var.rds_name
  username               = var.db_user
  password               = random_password.pw.result
  skip_final_snapshot    = var.rds_instance.skip_final_snapshot
  vpc_security_group_ids = [var.sg]
  tags = {
    Env = var.env
  }
}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [var.subnet[0], var.subnet[1]]

  tags = {
    Env = var.env
  }
}