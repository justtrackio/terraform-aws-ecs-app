module "ssm_label" {
  source  = "justtrackio/label/null"
  version = "0.26.0"

  delimiter   = "/"
  label_order = var.label_orders.ssm

  context = module.this.context
}

data "aws_ssm_parameter" "container_tag" {
  count = var.app_image_tag == null ? 1 : 0
  name  = "/${module.ssm_label.id}/container_tag"
}

data "aws_ecs_cluster" "default" {
  cluster_name = module.this.environment
}

data "aws_ssm_parameter" "keep_api_key" {
  name = "/keep/api_key"
}

data "aws_ssm_parameter" "sentry_token" {
  name = "/sentry/token"
}

data "aws_vpc" "default" {
  tags = {
    account_name = "${module.this.organizational_unit}-${module.this.namespace}"
  }
}

data "aws_ssm_parameter" "grafana_token" {
  name = "/grafana/token"
}

data "aws_lb" "default" {
  count = length(var.alb_name) > 0 ? 1 : 0
  name  = "${module.this.environment}-${var.alb_name}"
}

data "aws_lb_listener" "http" {
  count             = length(var.alb_name) > 0 ? 1 : 0
  load_balancer_arn = data.aws_lb.default[0].arn
  port              = 80
}

data "aws_lb_listener" "https" {
  count             = length(var.alb_name) > 0 ? 1 : 0
  load_balancer_arn = data.aws_lb.default[0].arn
  port              = 443
}
