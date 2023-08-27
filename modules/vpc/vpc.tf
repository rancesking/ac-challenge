# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Env = var.env
    Name = "Challenge-Arroyo"
  }
}

# Create Web Public Subnet
resource "aws_subnet" "web-subnet" {
  count                   = var.item_count
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.web_subnet_cidr[count.index]
  availability_zone       = var.availability_zone_names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Env  = var.env
    Name = "Web-${count.index + 1}"
  }
}

# Create Database Private Subnet
resource "aws_subnet" "database-subnet" {
  count                   = var.item_count
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.database_subnet_cidr[count.index]
  availability_zone       = var.availability_zone_names[count.index]
  map_public_ip_on_launch = false

  tags = {
    Env  = var.env
    Name = "Database-${count.index + 1}"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Env = var.env
  }
}

# Create Web layer route table
resource "aws_route_table" "web-rt" {
  vpc_id = aws_vpc.main.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Env = var.env
    Name = "Web-RT"
  }
}

# Create Web Subnet association with Web route table
resource "aws_route_table_association" "rt_association" {
  count          = var.item_count
  subnet_id      = aws_subnet.web-subnet[count.index].id
  route_table_id = aws_route_table.web-rt.id
}

# Create Web Security Group
resource "aws_security_group" "web-sg" {
  name        = "${var.env}-Web-SG"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "HTTP from VPC"
    from_port   = var.lb_port
    to_port     = var.lb_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Env = var.env
  }
}


#Create Database Security Group
resource "aws_security_group" "database-sg" {
  name        = "${var.env}-Database-SG"
  description = "Allow inbound traffic from application layer"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "Allow traffic from application layer"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.only_ssh_bastion.id, aws_security_group.web-sg.id]
  }

  ingress {
    description = "5432 from VPC"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 32768
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Env = var.env
  }
}

resource "aws_security_group" "only_ssh_bastion" {
  name   = "only_ssh_bastion"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "only_ssh_bastion"
  }
}