variable "name" {
  description = "Project name used as a prefix for all resources."
  type        = string
}

variable "environment" {
  description = "Deployment environment (dev, staging, prod)."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC. Must be a /16 so the /24 subnet math works."
  type        = string
  default     = "10.0.0.0/16"

  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0)) && tonumber(split("/", var.vpc_cidr)[1]) == 16
    error_message = "The vpc_cidr value must be a valid /16 CIDR block."
  }
}

variable "availability_zones" {
  description = "AZs to spread subnets across (one public + one private subnet per AZ)."
  type        = list(string)

  validation {
    condition     = length(var.availability_zones) >= 2 && length(var.availability_zones) <= 6
    error_message = "Provide between 2 and 6 availability zones."
  }
}

variable "enable_nat_gateway" {
  description = "Create NAT gateway(s) so private subnets can reach the internet."
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Use one shared NAT gateway (cheaper) instead of one per AZ (highly available)."
  type        = bool
  default     = true
}

variable "enable_flow_logs" {
  description = "Send VPC flow logs to CloudWatch and alarm on rejected traffic."
  type        = bool
  default     = true
}

variable "flow_log_retention_days" {
  description = "How long to keep flow logs."
  type        = number
  default     = 14
}

variable "reject_alarm_threshold" {
  description = "Rejected flows per 5 minutes before the CloudWatch alarm fires."
  type        = number
  default     = 100
}

variable "tags" {
  description = "Extra tags applied to every resource."
  type        = map(string)
  default     = {}
}
