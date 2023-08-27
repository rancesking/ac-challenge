# CloudWatch alarm that triggers the autoscaling up policy Frontend Cluster
resource "aws_cloudwatch_metric_alarm" "front_service_cpu_high" {
  alarm_name          = "${var.env}-frontend_cpu_utilization_high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "60"
  statistic           = "Average"
  threshold           = "60"

  dimensions = {
    ClusterName = aws_ecs_cluster.main.name
    ServiceName = aws_ecs_service.main.name
  }

  alarm_actions     = [aws_sns_topic.alarm.arn]
  ok_actions        = [aws_sns_topic.alarm.arn]
  alarm_description = "Monitor CPU usage of Frontend ECS Instance"
}

# CloudWatch alarm that triggers the autoscaling down policy
resource "aws_cloudwatch_metric_alarm" "front_service_memory_high" {
  alarm_name          = "${var.env}-frontend_Memory_utilization_high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  period              = "60"
  statistic           = "Average"
  threshold           = "80"

  dimensions = {
    ClusterName = aws_ecs_cluster.main.name
    ServiceName = aws_ecs_service.main.name
  }

  alarm_actions     = [aws_sns_topic.alarm.arn]
  ok_actions        = [aws_sns_topic.alarm.arn]
  alarm_description = "Monitor Memory usage of Frontend ECS Instance"
}

