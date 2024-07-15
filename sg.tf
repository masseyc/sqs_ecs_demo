resource "aws_security_group" "alb" {
  name        = "${local.csi}-alb"
  description = "Allow traffic to ALB"
  vpc_id      = aws_vpc.main.id

  tags = local.default_tags
}

resource "aws_security_group" "rest_api" {
  name        = "${local.csi}-rest-api"
  description = "Allow traffic to ECS Service"
  vpc_id      = aws_vpc.main.id

  tags = local.default_tags
}
