variable "name" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "admin_cidrs" {
  description = "CIDRs allowed to SSH to the bastion. Never use 0.0.0.0/0 here."
  type        = list(string)

  validation {
    condition     = !contains(var.admin_cidrs, "0.0.0.0/0")
    error_message = "Opening SSH to 0.0.0.0/0 is not allowed."
  }
}

variable "app_port" {
  type    = number
  default = 8080
}

variable "tags" {
  type    = map(string)
  default = {}
}
