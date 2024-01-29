module "sentry" {
  count   = module.this.enabled && var.sentry_enabled ? 1 : 0
  source  = "justtrackio/project/sentry"
  version = "1.3.0"

  context     = module.this.context
  label_order = var.label_orders.sentry

  id_length_limit = 50
}

moved {
  from = module.sentry
  to   = module.sentry[0]
}
