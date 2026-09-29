variable "region" {
  type    = string
  default = "ca-central-1"
}

variable "name" {
  type    = string
  default = "netlab"
}

variable "vpc_cidr" {
  type    = string
  default = "10.10.0.0/16"
}

variable "az_count" {
  type    = number
  default = 2
}

variable "admin_cidrs" {
  description = "Your public IP in CIDR form, e.g. 203.0.113.10/32"
  type        = list(string)
}
