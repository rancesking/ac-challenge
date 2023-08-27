output "db_endpoint" {
  value = aws_db_instance.default.endpoint
}
output "db_user" {
  value = aws_db_instance.default.username
}
output "db_pass" {
  value = nonsensitive(random_password.pw.result)
}