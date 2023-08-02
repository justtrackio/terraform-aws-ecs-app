module "alb_ingress" {
  count   = length(var.alb_name) > 0 ? 1 : 0
  source  = "cloudposse/alb-ingress/aws"
  version = "0.25.1"

  label_order = var.label_orders.ec2

  context     = module.this.context
  vpc_id      = data.aws_vpc.default.id
  target_type = "instance"

  health_check_path     = var.alb_health_check_path
  health_check_matcher  = var.alb_health_check_matcher
  health_check_interval = var.alb_health_check_interval

  target_group_name = var.alb_target_group_name

  unauthenticated_priority      = var.alb_unauthenticated_priority
  unauthenticated_paths         = var.alb_unauthenticated_paths
  unauthenticated_hosts         = var.alb_unauthenticated_hosts
  unauthenticated_listener_arns = [data.aws_lb_listener.http[0].arn, data.aws_lb_listener.https[0].arn]

  stickiness_enabled = var.alb_stickiness_enabled
}
