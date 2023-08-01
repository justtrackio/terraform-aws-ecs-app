locals {
  alb_enabled                         = length(var.alb_name) > 0
  mpr_enabled                         = var.mpr_enabled
  internal_predefined_metric_type     = local.alb_enabled ? "ALBRequestCountPerTarget" : "ECSServiceAverageCPUUtilization"
  internal_predefined_target_value    = local.alb_enabled ? 1000 : 100
  internal_customized_target_value    = 500
  autoscaling_predefined_metric_type  = var.autoscaling_predefined_metric_type != null ? var.autoscaling_predefined_metric_type : local.internal_predefined_metric_type
  autoscaling_predefined_target_value = var.autoscaling_target_value != null ? var.autoscaling_target_value : local.internal_predefined_target_value
  autoscaling_customized_target_value = var.autoscaling_target_value != null ? var.autoscaling_target_value : local.internal_customized_target_value
  predefined_autoscaling_enabled = (
    var.autoscaling_enabled &&
    !local.customized_autoscaling_enabled
  )
  autoscaling_customized_metric_name = local.mpr_enabled ? "StreamMprMessagesPerRunner" : var.autoscaling_customized_metric_name
  customized_autoscaling_enabled = (
    var.autoscaling_enabled &&
    (
      length(var.autoscaling_customized_metric_name) > 0 ||
      local.mpr_enabled
    )
  )
}

module "cloudwatch_label" {
  source  = "justtrackio/label/null"
  version = "0.26.0"

  delimiter   = "/"
  label_order = var.label_orders.cloudwatch

  context = module.this.context
}

module "ecs_service_task_predefined_autoscaling" {
  count   = local.predefined_autoscaling_enabled ? 1 : 0
  source  = "justtrackio/ecs-autoscaling/aws"
  version = "1.1.0"

  context = module.this.context

  aws_account_id = module.this.aws_account_id
  cluster_name   = data.aws_ecs_cluster.default.cluster_name
  service_name   = module.ecs_label.id
  enabled        = var.autoscaling_enabled
  min_capacity   = var.autoscaling_min_capacity
  max_capacity   = var.autoscaling_max_capacity
  target_tracking = [{
    target_value                    = local.autoscaling_predefined_target_value
    scale_in_cooldown               = var.autoscaling_scale_in_cooldown
    scale_out_cooldown              = var.autoscaling_scale_out_cooldown
    customized_metric_specification = []
    predefined_metric_specification = [{
      predefined_metric_type = local.autoscaling_predefined_metric_type
      resource_label         = local.alb_enabled ? "${data.aws_lb.default[0].arn_suffix}/${module.alb_ingress[0].target_group_arn_suffix}" : null
    }]
  }]

  depends_on = [
    module.service_task,
  ]
}

module "ecs_service_task_customized_autoscaling" {
  count   = local.customized_autoscaling_enabled ? 1 : 0
  source  = "justtrackio/ecs-autoscaling/aws"
  version = "1.1.0"

  context = module.this.context

  aws_account_id = module.this.aws_account_id
  cluster_name   = data.aws_ecs_cluster.default.cluster_name
  service_name   = module.ecs_label.id
  enabled        = var.autoscaling_enabled
  min_capacity   = var.autoscaling_min_capacity
  max_capacity   = var.autoscaling_max_capacity
  target_tracking = [{
    target_value                    = local.autoscaling_customized_target_value
    scale_in_cooldown               = var.autoscaling_scale_in_cooldown
    scale_out_cooldown              = var.autoscaling_scale_out_cooldown
    predefined_metric_specification = []
    customized_metric_specification = [{
      metric_name = local.autoscaling_customized_metric_name
      namespace   = module.cloudwatch_label.id
      statistic   = var.autoscaling_customized_statistic
      unit        = var.autoscaling_customized_unit
    }]
  }]

  depends_on = [
    module.service_task,
  ]
}

module "ecs_service_task_schedule" {
  count   = var.autoscaling_enabled && length(var.autoscaling_schedule) > 0 ? 1 : 0
  source  = "justtrackio/ecs-autoscaling/aws"
  version = "1.1.0"

  context = module.this.context

  aws_account_id = module.this.aws_account_id
  cluster_name   = data.aws_ecs_cluster.default.cluster_name
  service_name   = module.ecs_label.id
  enabled        = var.autoscaling_enabled
  schedule       = var.autoscaling_schedule
}
