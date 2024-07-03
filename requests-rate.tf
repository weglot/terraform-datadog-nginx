locals {
  requests_rate_filter = coalesce(
    var.requests_rate_filter_override,
    var.filter_str
  )
}

module "requests-rate" {
  source  = "weglot/generic-monitor/datadog"
  version = "1.1.0"

  name  = "Nginx - Requests performed"
  query = "avg(${var.requests_rate_evaluation_period}):sum:nginx.net.request_per_s{${local.requests_rate_filter}} > ${var.requests_rate_critical}"

  alert_message    = "Nginx hits rate ({{value}}) for ${var.service} > {{threshold}} reqs/s "
  recovery_message = "Nginx hits rate for ${var.service} has recovered"

  # module level vars
  env                  = var.env
  service              = var.service
  service_display_name = var.service_display_name
  notification_channel = var.notification_channel
  additional_tags      = var.additional_tags
  name_prefix          = var.name_prefix
  name_suffix          = var.name_suffix
  restricted_roles     = var.restricted_roles

  # monitor level vars
  enabled            = var.requests_rate_enabled
  alerting_enabled   = var.requests_rate_alerting_enabled
  warning_threshold  = var.requests_rate_warning
  critical_threshold = var.requests_rate_critical
  priority           = var.requests_rate_priority
  docs               = var.requests_rate_docs
  note               = var.requests_rate_note
  # new_group_delay    = var.requests_rate_new_group_delay
}
