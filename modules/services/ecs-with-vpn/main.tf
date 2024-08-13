

module "vpc" {
  source                 = "git::https://github.com/gruntwork-io/terraform-aws-vpc.git//.//modules/vpc-app?ref=v0.26.24"
  vpc_name               = var.vpc_name
  num_nat_gateways       = var.num_nat_gateways
  cidr_block             = var.vpc_cidr_block
  num_availability_zones = 1
}

module "ecs" {
  source                = "git::https://github.com/gruntwork-io/terraform-aws-ecs.git//.//modules/ecs-cluster?ref=v0.38.1"
  cluster_name          = var.cluster_name
  cluster_min_size      = var.cluster_min_size
  cluster_max_size      = var.cluster_max_size
  cluster_instance_ami  = var.cluster_instance_ami
  cluster_instance_type = var.cluster_instance_type

  cluster_instance_keypair_name = var.cluster_instance_keypair_name
  cluster_instance_user_data    = "#!/bin/bash\n echo \"ECS_CLUSTER=${var.cluster_name}\" >> /etc/ecs/ecs.config\n echo 'ECS_AVAILABLE_LOGGING_DRIVERS=[\"json-file\",\"awslogs\",\"logentries\"]' >> /etc/ecs/ecs.config"

  capacity_provider_enabled = true

  vpc_id         = module.vpc.vpc_id
  vpc_subnet_ids = keys(module.vpc.private_app_subnets)
}

locals {
  log_group_name = "/ecs/${var.service_name}-service"
}

module "logs" {
  source         = "../loggroup"
  log_group_name = local.log_group_name
}

module "service" {
  source                  = "git::https://github.com/gruntwork-io/terraform-aws-ecs.git//.//modules/ecs-service?ref=ecsDestroyProvisioner"
  service_name            = var.service_name
  ecs_cluster_arn         = module.ecs.ecs_cluster_arn
  desired_number_of_tasks = 1

  wait_for_steady_state = false

  ecs_task_container_definitions = jsonencode([
    {
      name      = "my-container"
      image     = "nginx:latest"
      memory    = 512
      cpu       = 256
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
      environment = [
        {
          name  = "test"
          value = "test-value"
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = local.log_group_name
          "awslogs-region"        = "us-east-1"
          "awslogs-stream-prefix" = "ecs"
        }
      }
    }
  ])
}
