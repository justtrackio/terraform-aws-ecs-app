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
      version = "1.6.0"
    }

    grafana = {
      source  = "grafana/grafana"
      version = "3.10.0"
    }

    elasticstack = {
      source  = "elastic/elasticstack"
      version = "0.11.11"
    }

    sentry = {
      source  = "jianyuan/sentry"
      version = "0.13.2"
    }
  }

  required_version = ">= 1.3.0"
}
