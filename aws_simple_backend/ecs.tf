resource "aws_ecs_cluster" "backend" {
  name = "backend"

  setting {
    name  = "containerInsights"
    value = "disabled"
  }
}

resource "aws_ecs_task_definition" "backend_ecs" {
  family                   = "fastapi"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 512
  memory                   = 1024
  execution_role_arn       = "${aws_iam_role.ecsTaskExecutionRole.arn}"
  task_role_arn            = "${aws_iam_role.ecs_execution_role.arn}"

  container_definitions = <<DEFINITION
[
  {
    "image": "550776679428.dkr.ecr.ap-northeast-2.amazonaws.com/fastapi:latest",
    "cpu": 384,
    "memory": 768,
    "name": "fastapi",
    "networkMode": "awsvpc",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 8080,
        "hostPort": 8080
      }
    ],
    "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "${aws_cloudwatch_log_group.log-group.id}",
          "awslogs-region": "ap-northeast-2",
          "awslogs-stream-prefix": "fastapi"
        }
       }
    },
    {
      "name": "nginx",
      "image": "550776679428.dkr.ecr.ap-northeast-2.amazonaws.com/nginx:latest",
      "essential": true,
      "networkMode": "awsvpc",
      "cpu": 128,
      "memory": 256,
      "portMappings": [
        {
          "containerPort": 80,
          "hostPort": 80
        }
      ],
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
            "awslogs-group": "${aws_cloudwatch_log_group.log-group.id}",
            "awslogs-region": "ap-northeast-2",
            "awslogs-stream-prefix": "nginx"
        }
      }
    }
]
DEFINITION
}


resource "aws_cloudwatch_log_group" "log-group" {
  name = "backend-logs"
}

resource "aws_ecs_service" "backend-service" {
  name                              = "backend-service"
  cluster                           = aws_ecs_cluster.backend.id
  task_definition                   = aws_ecs_task_definition.backend_ecs.arn
  scheduling_strategy               = "REPLICA"
  launch_type                       = "FARGATE"
  enable_execute_command            = true  
  enable_ecs_managed_tags           = true
  desired_count                     = 1

  deployment_controller {
    type = "ECS"
  }

  network_configuration {
    security_groups = [aws_security_group.backend.id]
    subnets         = [aws_subnet.private_a.id, aws_subnet.private_b.id]
    assign_public_ip = false
  }
 
  load_balancer {
    target_group_arn = aws_lb_target_group.backend.id
    container_name   = "nginx"
    container_port   = 80
  }
 
  depends_on = [aws_lb_listener.backend, aws_lb_listener.backend_https]

  lifecycle {
    ignore_changes = [task_definition, desired_count]

  }


}

