
provider "aws" {
  
  region = local.aws_region_main
}




locals {
  #copy and past .tfvars here
aws_region_main   = "us-east-1"
aws_region_backup = "us-east-2"
common_tags = {
  "id"             = "2560"
  "owner"          = "s6pteer"
  "teams"          = "peter-emma"
  "environment"    = "dev"
  "project"        = "s5-homework"
  "create_by"      = "Terraform"
  "cloud_provider" = "aws"
}
 
}





module "s3-buckup-module" {
source            = "../../resources/s3-backup-resources"
aws_region_main   = local.aws_region_main
aws_region_backup = local.aws_region_backup
common_tags       = local.common_tags


}