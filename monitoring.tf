locals {
  gosoline_metadata = var.gosoline_metadata != null ? var.gosoline_metadata : {
    domain    = "${module.this.organizational_unit}.${module.this.namespace}"
    use_https = false
    port      = 8070
  }
  elasticsearch_host    = var.elasticsearch_host != null ? var.elasticsearch_host : "http://elasticsearch.${module.this.organizational_unit}-monitoring.${var.domain}:9200"
  grafana_dashboard_url = var.grafana_dashboard_url != null ? var.grafana_dashboard_url : "https://grafana.${module.this.organizational_unit}-monitoring.${var.domain}"
}

module "monitoring" {
  count  = var.monitoring_enabled ? 1 : 0
  source = "github.com/justtrackio/terraform-aws-ecs-gosoline-monitoring?ref=remove_provider_config_in_favor_of_count"

  context = module.this.context

  alarm_enabled       = var.alarm_enabled
  organizational_unit = module.this.organizational_unit
  label_orders        = var.label_orders

  alarm_consumer  = var.alarm_consumer
  alarm_gateway   = var.alarm_gateway
  alarm_kinsumer  = var.alarm_kinsumer
  alarm_scheduled = var.alarm_scheduled

  elasticsearch_index_template   = var.elasticsearch_index_template
  elasticsearch_lifecycle_policy = var.elasticsearch_lifecycle_policy
}