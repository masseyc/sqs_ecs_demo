project     = "sqs-ecs"
environment = "demo"
component   = "rest-api"

region = "eu-west-1"

default_tags = {
  "Project"     = "sqs-ecs"
  "Environment" = "demo"
}

ecs_image = "public.ecr.aws/poc-hello-world/greeter-service:latest"

vpc_cidr = "10.100.0.0/16"
