resource "aws_subnet" "subnets" {
  count                   = length(var.cidrs)
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidrs[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = merge(
    local.default_tags,
    {
      Name = format(
        "%s-%s-%s",
        local.csi,
        var.name,
        var.availability_zones[count.index],
      )
    }
  )
}
