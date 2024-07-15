resource "aws_ecs_cluster" "main" {
  name = local.csi
  tags = local.default_tags
}
