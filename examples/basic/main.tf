module "example" {
  source = "../.."

  name                        = "hello-world"
  app_image_repository        = "nginx"
  app_image_tag               = "latest"
  log_router_image_repository = "public.ecr.aws/aws-observability/aws-for-fluent-bit"
  log_router_image_tag        = "stable"
  ecs_cluster_arn             = "arn:aws:ecs:eu-central-1:123456789012:cluster/my-cluster"
  aws_region                  = "eu-central-1"
  aws_account_id              = "123456789012"
  ecs_cluster_name            = "my-cluster"
  port_gateway                = 80
  port_health                 = 80
  port_metadata               = 80
  log_router_options          = {}
  healthcheck = {
    command = [
      "CMD",
      "/usr/bin/curl",
      "localhost:80"
    ],
    retries     = 3
    timeout     = 5
    interval    = 10
    startPeriod = 60
  }
}
