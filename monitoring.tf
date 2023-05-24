module "monitoring" {
  source = "./terraform-aws-ecs-gosoline-monitoring"
  #version = "1.3.0"

  context = module.this.context

  alarm_enabled       = var.alarm_enabled
  domain              = var.domain
  organizational_unit = var.organizational_unit

  alarm_consumer  = var.alarm_consumer
  alarm_gateway   = var.alarm_gateway
  alarm_kinsumer  = var.alarm_kinsumer
  alarm_scheduled = var.alarm_scheduled

  elasticsearch_index_template   = var.elasticsearch_index_template
  elasticsearch_lifecycle_policy = var.elasticsearch_lifecycle_policy
}
