resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = merge(
    var.default_tags,
    {
      Name = local.csi
    }
  )
}
