data "aws_availability_zones" "available" {
  state = "available"
}

module "network" {
  source = "./modules/network"

  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"

  public_az  = data.aws_availability_zones.available.names[0]
  private_az = data.aws_availability_zones.available.names[1]

  admin_cidr = var.admin_cidr
}

module "compute" {
  source = "./modules/compute"

  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  web_count     = var.web_count

  public_subnet_id  = module.network.public_subnet_id
  private_subnet_id = module.network.private_subnet_id

  web_security_group_id = module.network.web_security_group_id
  db_security_group_id  = module.network.db_security_group_id
}
