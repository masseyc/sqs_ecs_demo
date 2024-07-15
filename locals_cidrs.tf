locals {
  rest_api_cidrs = [
    cidrsubnet(var.vpc_cidr, 12, 0), # 0.0/28
    cidrsubnet(var.vpc_cidr, 12, 1), # 0.16/28
    cidrsubnet(var.vpc_cidr, 12, 2), # 0.32/28
  ]

  alb_cidrs = [
    cidrsubnet(var.vpc_cidr, 12, 3), # 0.48/28
    cidrsubnet(var.vpc_cidr, 12, 4), # 0.64/28
    cidrsubnet(var.vpc_cidr, 12, 5), # 0.80/28
  ]

  natgw_cidrs = [
    cidrsubnet(var.vpc_cidr, 12, 6), # 0.96/28
    cidrsubnet(var.vpc_cidr, 12, 7), # 0.112/28
    cidrsubnet(var.vpc_cidr, 12, 8), # 0.128/28
  ]
  
}
