resource "aws_instance" "BASTION" {
  ami                         = "ami-0cff7528ff583bf9a"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.web-subnet[0].id
  vpc_security_group_ids      = [aws_security_group.only_ssh_bastion.id]
  key_name                    = "Bastion"
  associate_public_ip_address = true

  tags = {
    Name = "bastionhost"
  }
}