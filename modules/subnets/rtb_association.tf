resource "aws_route_table_association" "main" {
  count          = length(var.cidrs)
  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = element(var.route_tables, count.index)
}
