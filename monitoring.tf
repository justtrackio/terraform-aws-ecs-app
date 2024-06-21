locals {
  gosoline_metadata = var.gosoline_metadata != null ? var.gosoline_metadata : {
    domain    = "${module.this.organizational_unit}.${module.this.namespace}"
    use_https = false
    port      = 8070
  }
  elasticsearch_host    = var.elasticsearch_host != null ? var.elasticsearch_host : "http://elasticsearch.${module.this.organizational_unit}-monitoring.${var.domain}:9200"
  grafana_dashboard_url = var.grafana_dashboard_url != null ? var.grafana_dashboard_url : "https://grafana.${module.this.organizational_unit}-monitoring.${var.domain}"
  kibana_host           = var.kibana_host != null ? var.kibana_host : "https://kibana.${module.this.organizational_unit}-monitoring.${var.domain}"
}

module "monitoring" {
  count   = var.monitoring_enabled ? 1 : 0
  source  = "justtrackio/ecs-gosoline-monitoring/aws"
  version = "2.4.0"

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
  elasticsearch_host             = local.elasticsearch_host

  kibana_data_view_enabled = var.kibana_data_view_enabled
  kibana_space_id          = var.kibana_space_id
}
