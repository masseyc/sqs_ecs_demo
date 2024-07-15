resource "aws_nat_gateway" "main" {
  # ideally this would be per az
  allocation_id = aws_eip.natgw.id
  subnet_id     = module.subnets_natgw.subnet_ids[0]

  tags = local.default_tags
}

resource "aws_eip" "natgw" {
  tags = local.default_tags
}
