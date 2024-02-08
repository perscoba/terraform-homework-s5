
# Provider Block
provider "aws" {
  region = local.aws_region
}


locals {
  aws_region    = "us-east-2"
  ami           = "ami-01909897f17a87908"
  instance_type = "t2.micro"
  key_name      = "main-key"
  subnet_id     = "subnet-077162a00b6704f4a"
  common_tags = {
    "AssetID"       = "2560"
    "AssetName"     = "Insfrastructure"
    "Teams"         = "S6peter"
    "Environment"   = "dev"
    "Project"       = "tia"
    "CreateBy"      = "Terraform"
    "cloudProvider" = "aws"
  }

}

module "s5-homework" {
  source        = "../../resources/bastion-host/ec2-packer-02"
  ami           = local.ami
  instance_type = local.instance_type
  key_name      = local.key_name
  subnet_id     = local.subnet_id
  common_tags   = local.common_tags
  aws_region        = local.aws_region
}