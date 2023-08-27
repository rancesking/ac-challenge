
#Create web subnet Load Balancer
resource "aws_lb" "main" {
  name               = "${var.env}-External-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web-sg.id]
  subnets            = [aws_subnet.web-subnet[0].id, aws_subnet.web-subnet[1].id]
}

resource "aws_alb_target_group" "main" {
  name        = "${var.env}-ALB-TG"
  port        = var.lb_port
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "ip"

  health_check {
    enabled             = true
    healthy_threshold   = "3"
    interval            = "80"
    protocol            = "HTTP"
    port                = "traffic-port"
    matcher             = "200,304"
    timeout             = "50"
    path                = var.front_health_check_path
    unhealthy_threshold = "2"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_alb_listener" "http" {
  load_balancer_arn = aws_lb.main.id
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.main.id
    type             = "forward"
  }
}
