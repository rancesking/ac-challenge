resource "aws_instance" "BASTION" {
  ami                         = var.instance_ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet[0]
  vpc_security_group_ids      = [var.sg]
  key_name                    = "Bastion"
  associate_public_ip_address = true
  depends_on = [ aws_key_pair.kp ]
  tags = {
    Name = "AC-bastionhost"
  }
}

resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = "Bastion"       # Create "myKey" to AWS!!
  public_key = tls_private_key.pk.public_key_openssh

  provisioner "local-exec" { # Create "myKey.pem" to your computer!!
    command = "echo '${tls_private_key.pk.private_key_pem}' > ./myKey.pem"
  }
  depends_on = [ tls_private_key.pk ]
}