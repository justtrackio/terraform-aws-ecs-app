locals {
  sentry_alarm_actions = var.sentry_alarm_actions != "[]" ? var.sentry_alarm_actions : jsonencode(
    [
      {
        id : "sentry.rules.actions.notify_event_service.NotifyEventServiceAction",
        service : "webhooks"
      }
    ]
  )

  sentry_alarm_conditions = var.sentry_alarm_conditions != "[]" ? var.sentry_alarm_conditions : jsonencode(
    [
      {
        id : "sentry.rules.conditions.first_seen_event.FirstSeenEventCondition"
      }
    ]
  )

  sentry_alarm_filters = var.sentry_alarm_filters != null ? var.sentry_alarm_filters : jsonencode(
    [
      {
        id : "sentry.rules.filters.level.LevelFilter",
        match : "gte",
        level : "40"
      }
    ]
  )
}

module "sentry" {
  count   = module.this.enabled && var.sentry_enabled ? 1 : 0
  source  = "justtrackio/project/sentry"
  version = "1.4.1"

  context     = module.this.context
  label_order = var.label_orders.sentry

  alarm_enabled = var.alarm_enabled

  alarm_actions      = local.sentry_alarm_actions
  alarm_action_match = var.sentry_alarm_action_match
  alarm_conditions   = local.sentry_alarm_conditions
  alarm_filters      = local.sentry_alarm_filters
  alarm_filter_match = var.sentry_alarm_filter_match
  alarm_frequency    = var.sentry_alarm_frequency

  webhook_url = "https://keep-backend.${module.this.organizational_unit}-monitoring.${var.domain}/alerts/event/sentry?api_key=${data.aws_ssm_parameter.keep_api_key.value}"
}
