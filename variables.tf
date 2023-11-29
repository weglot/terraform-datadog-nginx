
variable "filter_str" {
  type = string
}

variable "env" {
  type = string
}

variable "service" {
  type = string
}

variable "service_display_name" {
  type    = string
  default = null
}

variable "notification_channel" {
  type = string
}

variable "additional_tags" {
  type    = list(string)
  default = []
}

variable "name_prefix" {
  type    = string
  default = ""
}

variable "name_suffix" {
  type    = string
  default = ""
}
