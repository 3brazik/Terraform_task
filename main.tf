module "network" {
  source                = "./network"
  cidr                  = var.cidr
  public_subnet_1_cidr  = var.public_subnet_2_cidr
  public_subnet_2_cidr  = var.public_subnet_1_cidr
  private_subnet_1_cidr = var.private_subnet_1_cidr
  private_subnet_2_cidr = var.private_subnet_2_cidr
  ami_name              = var.ami_name
  ami_id                = var.ami_id
  region                = var.region

}