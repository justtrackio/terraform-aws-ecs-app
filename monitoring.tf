module "monitoring" {
  source = "./terraform-aws-ecs-gosoline-monitoring"
  #version = "1.3.0"

  context = module.this.context

  alarm_enabled             = var.alarm_enabled
  grafana_dashboard_enabled = true
  domain                    = var.domain
  organizational_unit       = var.organizational_unit
}
