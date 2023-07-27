module "sentry" {
  source  = "justtrackio/project/sentry"
  version = "1.2.0"

  context     = module.this.context
  label_order = var.label_orders.sentry

  base_url = "http://sentry.${module.this.organizational_unit}-monitoring.${var.domain}"
  token    = data.aws_ssm_parameter.sentry_token.value
}
