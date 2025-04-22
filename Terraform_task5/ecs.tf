resource "aws_ecs_cluster" "strapi" {
  name = "strapi-cluster"
}

resource "aws_ecs_task_definition" "strapi_task" {
  family = "strapi-task"
  network_mode = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu = "512"
  memory = "1024"

  container_definitions = jsonencode([{
    name = "strapi"
    image = "905418107991.dkr.ecr.us-east-1.amazonaws.com/strapi_latest:latest"
    essential = true
    portMappings = [{
      containerPort = 1337
      protocol = "tcp"
    }]
    environment = [
      {
        name = "HOST"
        value = "0.0.0.0"
      },
      {
        name = "PORT"
        value = "1337"
      },
      {
        name = "APP_KEYS"
        value = "your_key1,your_key2"
      }
    ]
  }])
}

resource "aws_ecs_service" "strapi_service" {
  name = "strapi-service"
  cluster = aws_ecs_cluster.strapi.id
  launch_type = "FARGATE"
  desired_count = 1

  network_configuration {
    subnets = aws_subnet.public[*].id
    assign_public_ip = true
    security_groups = [aws_security_group.strapi_sg.id]
  }

  task_definition = aws_ecs_task_definition.strapi_task.arn
}
