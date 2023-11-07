terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.67"
    }

    elasticsearch = {
      source  = "phillbaker/elasticsearch"
      version = "2.0.7"
    }

    gosoline = {
      source  = "justtrackio/gosoline"
      version = "1.2.4"
    }

    grafana = {
      source  = "grafana/grafana"
      version = "2.2.0"
    }

    elasticstack = {
      source  = "elastic/elasticstack"
      version = "0.6.2"
    }

    sentry = {
      source  = "jianyuan/sentry"
      version = "0.11.2"
    }
  }

  required_version = ">= 1.3.0"
}
