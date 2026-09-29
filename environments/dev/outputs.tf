output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "nat_gateway_public_ips" {
  value = module.vpc.nat_gateway_public_ips
}

output "security_group_ids" {
  value = {
    bastion = module.security.bastion_sg_id
    web     = module.security.web_sg_id
    app     = module.security.app_sg_id
  }
}
