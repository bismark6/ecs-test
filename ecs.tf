resource "aws_ecs_cluster" "ecs" {
  name = "app_cluster"
}

resource "aws_ecs_service" "service" {
  name = "app_service"
  cluster                = aws_ecs_cluster.ecs.arn
  launch_type            = "FARGATE"
  enable_execute_command = true

  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  desired_count                      = 1
  task_definition                    = aws_ecs_task_definition.td.arn

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.sg.id]
    subnets          = [aws_subnet.private-a.id, aws_subnet.private-b.id, aws_subnet.private-c.id, aws_subnet.private-d.id, aws_subnet.private-e.id, aws_subnet.private-f.id]
  }
}

resource "aws_ecs_task_definition" "td" {
  family                   = "prod"
  container_definitions = jsonencode([
    {
      name         = "prod"
      image        = "287350188447.dkr.ecr.us-east-1.amazonaws.com/app_repo"
      cpu          = 256
      memory       = 512
      essential    = true
      portMappings = [
        {
          containerPort = 443
          hostPort      = 443
          protocol      = "tcp"
        }
      ]
    }
  ])
  runtime_platform {
    cpu_architecture = "X86_64"
    operating_system_family = "LINUX"
  }
  requires_compatibilities = ["FARGATE"]

  cpu                = "256"
  memory             = "512"
  network_mode       = "awsvpc"
  task_role_arn      = "arn:aws:iam::287350188447:role/ecsTaskExecutionRole"
  execution_role_arn = "arn:aws:iam::287350188447:role/ecsTaskExecutionRole"
}

