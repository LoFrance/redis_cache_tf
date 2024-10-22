variable "prefix" {
  type    = string
}

variable "env_short" {
  type = string
  validation {
    condition = (
      length(var.env_short) <= 1
    )
    error_message = "Max length is 1 chars."
  }
}

variable "location_short" {
  type    = string
  default = "itn"
}

variable "location" {
  type    = string
  default = "italynorth"
}

variable "tags" {
  type = map(any)
}