provider "gosoline" {
  metadata = local.gosoline_metadata
  name_patterns = merge(var.gosoline_name_patterns, {
    kubernetes_namespace = ""
    kubernetes_pod       = ""
    traefik_service_name = ""
  })
  orchestrator = "ecs"
}

provider "grafana" {
  url  = local.grafana_dashboard_url
  auth = data.aws_ssm_parameter.grafana_token.value
}

provider "elasticsearch" {
  url = local.elasticsearch_host
}

provider "elasticstack" {
  elasticsearch {
    endpoints = [local.elasticsearch_host]
    insecure  = true
  }
}

provider "sentry" {
  base_url = "https://sentry.${module.this.organizational_unit}-monitoring.${var.domain}"
  token    = data.aws_ssm_parameter.sentry_token.value
}
