provider "gosoline" {
  metadata      = local.gosoline_metadata
  name_patterns = var.gosoline_name_patterns
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
