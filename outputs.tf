output "alb_endpoint" {
  value = aws_lb.main.dns_name
}
