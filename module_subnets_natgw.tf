module "subnets_natgw" {
  source = "./modules/subnets"
  project     = var.project
  environment = var.environment
  component   = var.component

  name = "natgw"

  cidrs = local.natgw_cidrs

  route_tables = [
    aws_route_table.public.id,
  ]

  availability_zones = data.aws_availability_zones.available.names

  vpc_id = aws_vpc.main.id

  default_tags = var.default_tags
  
}
