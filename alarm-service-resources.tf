module "alarm_service_resources" {
  count = var.alarm_service_resources_enabled ? 1 : 0

  source  = "justtrackio/alarm-service-resources/aws"
  version = "1.2.0"

  context      = module.this.context
  label_orders = var.label_orders

  alarm_description  = merge(module.this.tags, module.this.additional_tag_map)
  alarm_priority     = var.alarm_service_resources_priority
  cluster_name       = data.aws_ecs_cluster.default.cluster_name
  cpu_average        = var.alarm_service_resources_cpu_average
  cpu_maximum        = var.alarm_service_resources_cpu_maximum
  memory_average     = var.alarm_service_resources_memory_average
  memory_maximum     = var.alarm_service_resources_memory_maximum
  treat_missing_data = var.alarm_service_resources_treat_missing_data
}
