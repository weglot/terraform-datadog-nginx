variable "connection_dropped_enabled" {
  type    = bool
  default = true
}

variable "connection_dropped_warning" {
  type    = number
  default = null
}

variable "connection_dropped_critical" {
  type    = number
  default = 0
}

variable "connection_dropped_evaluation_period" {
  type    = string
  default = "last_5m"
}

variable "connection_dropped_note" {
  type    = string
  default = ""
}

variable "connection_dropped_docs" {
  type    = string
  default = "Dropped connections should be at zero. If your rate of dropped connections per unit time starts to rise, look for possible resource saturation."
}

variable "connection_dropped_filter_override" {
  type    = string
  default = ""
}

variable "connection_dropped_alerting_enabled" {
  type    = bool
  default = true
}

variable "connection_dropped_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 2
}
