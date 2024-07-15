module "subnets_alb" {
  source = "./modules/subnets"
  project     = var.project
  environment = var.environment
  component   = var.component

  name = "alb"

  cidrs = local.alb_cidrs

  route_tables = [
    aws_route_table.public.id,
  ]

  availability_zones = data.aws_availability_zones.available.names

  vpc_id = aws_vpc.main.id

  default_tags = var.default_tags
  
}
