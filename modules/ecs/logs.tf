# Set up CloudWatch group and log stream and retain logs for 30 days
resource "aws_cloudwatch_log_group" "main" {
  name              = "/ecs/${var.env}-cb-app"
  retention_in_days = 30

  tags = {
    Name = "${var.env}-cb-log-group"
  }
}

resource "aws_cloudwatch_log_stream" "cb_log_stream" {
  name           = "${var.env}-cb-log-stream"
  log_group_name = aws_cloudwatch_log_group.main.name
}