resource "aws_sqs_queue" "rest_api" {
  name = local.csi
  tags = local.default_tags
}
