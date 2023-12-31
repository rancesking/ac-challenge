#Frontend Autoscaling Policy
resource "aws_appautoscaling_target" "frontend_ecs_target" {
  max_capacity       = 4
  min_capacity       = 2
  resource_id        = "service/${aws_ecs_cluster.main.name}/${aws_ecs_service.main.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

resource "aws_appautoscaling_policy" "frontend_ecs_policy_memory" {
  name               = "${var.env}-frontend-memory-autoscaling"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.frontend_ecs_target.resource_id
  scalable_dimension = aws_appautoscaling_target.frontend_ecs_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.frontend_ecs_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageMemoryUtilization"
    }

    target_value = 80
  }
}

resource "aws_appautoscaling_policy" "frontend_ecs_policy_cpu" {
  name               = "${var.env}-frontend-cpu-autoscaling"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.frontend_ecs_target.resource_id
  scalable_dimension = aws_appautoscaling_target.frontend_ecs_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.frontend_ecs_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }

    target_value = 60
  }
}
