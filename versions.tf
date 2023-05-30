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
      version = "0.0.12"
    }

    grafana = {
      source  = "grafana/grafana"
      version = "1.40.1"
    }

    elasticstack = {
      source  = "elastic/elasticstack"
      version = "0.5.0"
    }
  }

  required_version = ">= 1.3.0"
}
