resource "aws_route_table" "private" {  
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.default_tags,
    {
      Name = "${local.csi}-private"
    }
  )
}

resource "aws_route" "igw" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

resource "aws_route_table" "public" {  
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.default_tags,
    {
      Name = "${local.csi}-public"
    }
  )
}

resource "aws_route" "natgw" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id          = aws_nat_gateway.main.id
}
