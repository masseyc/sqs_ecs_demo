resource "aws_lb" "main" {
  name            = local.csi
  internal        = false

  load_balancer_type = "application"

  security_groups = [
    aws_security_group.alb.id,
  ]
  subnets         = module.subnets_alb.subnet_ids

  tags            = local.default_tags
}

resource "aws_lb_listener" "rest_api" {
  load_balancer_arn = aws_lb.main.arn
  port              = "8080"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.rest_api.arn
  }
}

resource "aws_lb_target_group" "rest_api" {
  name     = local.csi
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  target_type = "ip"
  port        = "5002"

  health_check {
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = local.default_tags
}
