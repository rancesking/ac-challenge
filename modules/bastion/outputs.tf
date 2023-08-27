output "bastion_ip" {
  value = aws_instance.BASTION.public_ip
}