resource "aws_ecs_cluster" "main" {
  name = "${var.env}-${var.ecs_cluster_name}"
}

resource "aws_ecs_task_definition" "main" {
  family                   = "${var.env}-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn
  container_definitions = jsonencode([{
    name      = "${var.env}-container"
    image     = "${var.app_image}"
    essential = true
    portMappings = [{
      protocol      = "tcp"
      containerPort = var.lb_port
      hostPort      = var.lb_port
    }]
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        awslogs-group         = aws_cloudwatch_log_group.main.name
        awslogs-stream-prefix = "ecs"
        awslogs-region        = var.region
      }
    }
  }])

  tags = {
    Environment = var.env
  }
}


resource "aws_ecs_service" "main" {
  name                               = "${var.env}-service"
  cluster                            = aws_ecs_cluster.main.id
  task_definition                    = aws_ecs_task_definition.main.arn
  desired_count                      = var.app_count
  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200
  health_check_grace_period_seconds  = 60
  launch_type                        = "FARGATE"
  scheduling_strategy                = "REPLICA"
  force_new_deployment               = true
  

  network_configuration {
    security_groups  = [var.sg]
    subnets          = var.subnet
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = var.tg
    container_name   = "${var.env}-container"
    container_port   = var.lb_port
  }

  depends_on = [var.listener, aws_iam_role_policy_attachment.ecs_task_execution_role]
}
