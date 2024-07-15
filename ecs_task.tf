resource "aws_ecs_task_definition" "rest_api" {
  family                   = local.csi
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_role.rest_api_execution.arn
  task_role_arn            = aws_iam_role.rest_api_task.arn
  cpu    = 256
  memory = 512

  container_definitions = jsonencode([
    {
      name      = local.csi
      image     = var.ecs_image
      essential = true
      portMappings = [
        {
          containerPort = 5002
          protocol      = "tcp"
        }
      ]
      logConfiguration = {
        logDriver = "awslogs",
        options = {
          "awslogs-create-group"  = "true",
          "awslogs-group"         = "/ecs/${local.csi}/rest-api",
          "awslogs-region"        = var.region,
          "awslogs-stream-prefix" = "ecs"
        }
      },
      environment = [
        {
          name  = "sqs_queue_url"
          value = aws_sqs_queue.rest_api.id
        }
      ]

    }
  ])

  tags = local.default_tags
}
