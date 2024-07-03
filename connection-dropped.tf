locals {
  connection_dropped_filter = coalesce(
    var.connection_dropped_filter_override,
    var.filter_str
  )
}

module "connection-dropped" {
  source  = "weglot/generic-monitor/datadog"
  version = "1.1.0"

  name             = "Nginx - Connection dropped"
  query            = "avg(${var.connection_dropped_evaluation_period}):max:nginx.net.conn_dropped_per_s{${local.connection_dropped_filter}} by {service} > ${var.connection_dropped_critical}"
  alert_message    = "Nginx dropped connection ({{value}}) for ${var.service}  > {{threshold}} conns/s"
  recovery_message = "Nginx dropped connection for ${var.service} has recovered"

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
  enabled            = var.connection_dropped_enabled
  alerting_enabled   = var.connection_dropped_alerting_enabled
  warning_threshold  = var.connection_dropped_warning
  critical_threshold = var.connection_dropped_critical
  priority           = var.connection_dropped_priority
  docs               = var.connection_dropped_docs
  note               = var.connection_dropped_note
}
