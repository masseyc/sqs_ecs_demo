module "subnets_rest_api" {
  source = "./modules/subnets"
  project     = var.project
  environment = var.environment
  component   = var.component

  name = "rest-api"

  cidrs = local.rest_api_cidrs

  route_tables = [
    aws_route_table.private.id,
  ]

  availability_zones = data.aws_availability_zones.available.names

  vpc_id = aws_vpc.main.id

  default_tags = var.default_tags
  
}
