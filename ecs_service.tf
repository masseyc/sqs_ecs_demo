resource "aws_ecs_service" "rest_api" {
  name            = local.csi
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.rest_api.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = module.subnets_rest_api.subnet_ids
    security_groups  = [aws_security_group.rest_api.id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.rest_api.arn
    container_name   = local.csi
    container_port   = 5002
  }

  depends_on = [aws_ecs_task_definition.rest_api]

}
