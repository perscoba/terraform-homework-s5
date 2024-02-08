
# Provider Block
provider "aws" {
  region = local.aws_region
}


locals {

  vpc_prefix = "/2560/adl/vpc"

  common_tags = {
    "AssetID"       = "0006m"
    "AssetName"     = "s5-homework"
    "Environment"   = "dev-homework"
    "Project"       = "alpha"
    "CreateBy"      = "Terraform-s6peter"
    "cloudProvider" = "aws"
  }
  aws_region = "us-east-2"

  cidr_block                       = "10.0.0.0/16"
  instance_tenancy                 = "default"
  enable_dns_support               = true
  enable_dns_hostnames             = true
  enable_classiclink               = false
  enable_classiclink_dns_support   = false
  assign_generated_ipv6_cidr_block = false

  cluster_name = "demo-cluster-s6peter"

  private_subnets_db = [
    "10.0.4.0/24",
    "10.0.5.0/24",
    "10.0.6.0/24",
  ]

  public = [
    "10.0.7.0/24",
    "10.0.8.0/24",
    "10.0.9.0/24",
  ]


  aws_availability_zones = [
    "us-east-2a",
    "us-east-2b",
    "us-east-2c",
  ]


  shared = "shared"
}


module "s5-homework" {
  source                           = "../../resources/vpc-resource"
  cidr_block                       = local.cidr_block
  instance_tenancy                 = local.instance_tenancy
  enable_dns_support               = local.enable_dns_support
  enable_dns_hostnames             = local.enable_dns_hostnames
  enable_classiclink               = local.enable_classiclink
  enable_classiclink_dns_support   = local.enable_classiclink_dns_support
  assign_generated_ipv6_cidr_block = local.assign_generated_ipv6_cidr_block

  cluster_name       = local.cluster_name
  vpc_prefix         = local.vpc_prefix
  aws_region         = local.aws_region
  private_subnets_db = local.private_subnets_db
  public             = local.public

  aws_availability_zones = local.aws_availability_zones

  shared      = local.shared
  common_tags = local.common_tags
}