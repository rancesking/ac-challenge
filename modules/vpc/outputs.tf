output "sg" {
  value = aws_security_group.web-sg.id
}

output "sg-rds" {
  value = aws_security_group.database-sg.id
}

output "subnet" {
  value = aws_subnet.web-subnet.*.id
}

output "subnet-rds" {
  value = aws_subnet.database-subnet.*.id
}

output "tg" {
  value = aws_alb_target_group.main.id
}

output "listener" {
  value = aws_alb_listener.http.id
}