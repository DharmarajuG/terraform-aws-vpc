module "roboshop" {
  source = "git::https://github.com/DharmarajuG/terraform-aws-vpc.git?ref=main"
  project_name = var.project_name
  environment = var.environment
  common_tags = var.common_tags
  vpc_tags = var.vpc_tags
}