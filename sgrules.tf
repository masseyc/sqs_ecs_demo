resource "aws_vpc_security_group_ingress_rule" "alb_public" {
  security_group_id = aws_security_group.alb.id
  description       = "Allow inbound traffic from the internet on port 8080"
  from_port         = 8080
  to_port           = 8080
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "alb_traffic_rest_api" {
  security_group_id = aws_security_group.alb.id
  description       = "Allow outbound traffic from the ALB on port 5002"
  from_port         = 5002
  to_port           = 5002
  ip_protocol       = "tcp"

  referenced_security_group_id = aws_security_group.rest_api.id
}

resource "aws_vpc_security_group_ingress_rule" "rest_api_traffic" {
  security_group_id = aws_security_group.rest_api.id
  description       = "Allow inbound traffic from the ALB on port 5002"
  from_port         = 5002
  to_port           = 5002
  ip_protocol       = "tcp"

  referenced_security_group_id = aws_security_group.alb.id
}

resource "aws_vpc_security_group_egress_rule" "rest_api_allow_all" {
  security_group_id = aws_security_group.rest_api.id
  description       = "Allow outbound traffic to the internet on all ports"
  from_port         = -1
  to_port           = -1
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}
