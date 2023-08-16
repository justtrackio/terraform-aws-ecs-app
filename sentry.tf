module "sentry" {
  source  = "justtrackio/project/sentry"
  version = "1.3.0"

  context     = module.this.context
  label_order = var.label_orders.sentry
}

moved {
  from = module.sentry
  to   = module.sentry[0]
}
