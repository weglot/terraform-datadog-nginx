variable "requests_rate_enabled" {
  type    = bool
  default = true
}

variable "requests_rate_warning" {
  type    = number
  default = null
}

variable "requests_rate_critical" {
  type = number
}

variable "requests_rate_evaluation_period" {
  type    = string
  default = "last_30m"
}

variable "requests_rate_note" {
  type    = string
  default = ""
}

variable "requests_rate_docs" {
  type    = string
  default = ""
}

variable "requests_rate_filter_override" {
  type    = string
  default = ""
}

variable "requests_rate_alerting_enabled" {
  type    = bool
  default = true
}

variable "requests_rate_priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = 3
}

# variable "requests_rate_new_group_delay" {
#   description = "Time (in seconds) to skip evaluations for new groups."
#   type        = number
#   default     = 300
# }
