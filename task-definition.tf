resource "aws_ecs_task_definition" "web-td" {
  family                   = "web-app"
  task_role_arn            = var.ecs_task_role_arn
  execution_role_arn       = var.ecs_execution_role_arn
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 2048

  container_definitions = jsonencode([{
    name         = "web-app",
    image        = "registry.gitlab.com/architect-io/artifacts/nodejs-hello-world:latest",
    essential    = true,
    portMappings = [{ containerPort = 3000, hostPort = 3000 }],

    environment = [
      { name = "APPENV", value = "Test" }
    ]

    logConfiguration = {
      logDriver = "awslogs",
      options = merge(var.ecs_log_driver_options, {
        "awslogs-group" = aws_cloudwatch_log_group.log_group.name,
      })
    },
  }])
}