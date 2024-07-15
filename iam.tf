resource "aws_iam_role" "rest_api_task" {
  name = "${local.csi}-task"

  assume_role_policy = data.aws_iam_policy_document.ecs_task_assumerole.json

  tags = local.default_tags
}

resource "aws_iam_role_policy_attachment" "rest_api" {
  role       = aws_iam_role.rest_api_task.name
  policy_arn = aws_iam_policy.rest_api.arn
}

resource "aws_iam_policy" "rest_api" {
  name        = local.csi
  description = "Policy for ${local.csi}"
  policy      = data.aws_iam_policy_document.rest_api.json
}

data "aws_iam_policy_document" "rest_api" {
  statement {
    sid    = "AllowSQSSendMessage"
    effect = "Allow"

    actions = [
      "sqs:SendMessage",
    ]

    resources = [
      aws_sqs_queue.rest_api.arn,
    ]
  }
  
}

resource "aws_iam_role" "rest_api_execution" {
  name = "${local.csi}-execution"

  assume_role_policy = data.aws_iam_policy_document.ecs_task_assumerole.json

  tags = local.default_tags
}

resource "aws_iam_role_policy_attachment" "rest_api_logs" {
  role       = aws_iam_role.rest_api_execution.name
  policy_arn = aws_iam_policy.rest_api_logs.arn
}

resource "aws_iam_policy" "rest_api_logs" {
  name        = "${local.csi}-logs"
  description = "Policy for ${local.csi} logs"
  policy      = data.aws_iam_policy_document.rest_api_logs.json
}

data "aws_iam_policy_document" "rest_api_logs" {
  statement {
    sid    = "AllowECSCloudwatch"
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = [
      "*",
    ]
  }
  
}
