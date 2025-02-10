module "roboshop" {
  source = "git::https://github.com/DharmarajuG/terraform-aws-vpc.git?ref=main"
  project_name = var.project_name
  environment = var.environment
  common_tags = var.common_tags
  vpc_tags = var.vpc_tags

  public_subnets_cidr = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
  database_subnets_cidr = var.database_subnets_cidr
}