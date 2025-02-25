module "alb_ingress" {
  count   = length(var.alb_name) > 0 ? 1 : 0
  source  = "cloudposse/alb-ingress/aws"
  version = "0.30.0"

  label_order = var.label_orders.ec2

  context     = module.this.context
  vpc_id      = data.aws_vpc.default.id
  target_type = "instance"

  unauthenticated_priority      = var.alb_unauthenticated_priority
  unauthenticated_paths         = var.alb_unauthenticated_paths
  unauthenticated_hosts         = var.alb_unauthenticated_hosts
  unauthenticated_listener_arns = [data.aws_lb_listener.http[0].arn, data.aws_lb_listener.https[0].arn]

  health_check_enabled             = var.alb_health_check.enabled
  health_check_healthy_threshold   = var.alb_health_check.healthy_threshold
  health_check_interval            = var.alb_health_check.interval
  health_check_matcher             = var.alb_health_check.matcher
  health_check_path                = var.alb_health_check.path
  health_check_port                = var.alb_health_check.port
  health_check_protocol            = var.alb_health_check.protocol
  health_check_timeout             = var.alb_health_check.timeout
  health_check_unhealthy_threshold = var.alb_health_check.unhealthy_threshold

  stickiness_enabled = var.alb_stickiness_enabled
}
