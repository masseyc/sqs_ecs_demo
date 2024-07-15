data "aws_iam_policy_document" "ecs_task_assumerole" {
  statement {
    sid    = "ECSTaskAssumeRole"
    effect = "Allow"

    principals {
      type = "Service"

      identifiers = [
        "ecs-tasks.amazonaws.com",
      ]
    }

    actions = [ 
      "sts:AssumeRole",
     ]
  }
}
