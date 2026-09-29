data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source = "../../modules/vpc"

  name               = var.name
  environment        = "dev"
  vpc_cidr           = var.vpc_cidr
  availability_zones = slice(data.aws_availability_zones.available.names, 0, var.az_count)

  enable_nat_gateway = true
  single_nat_gateway = true # cost saving for dev
  enable_flow_logs   = true
}

module "security" {
  source = "../../modules/security"

  name        = var.name
  environment = "dev"
  vpc_id      = module.vpc.vpc_id
  admin_cidrs = var.admin_cidrs
}
