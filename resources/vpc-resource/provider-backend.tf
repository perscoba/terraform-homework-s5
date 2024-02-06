# # Terraform block
# terraform {
#   required_version = ">= 1.0.0"
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 3.0"
#     }
    
#   }

# }

# # Provider Block
# provider "aws" {
#   region = var.aws_region
# }




# terraform {
#   backend "s3" {
#     bucket         = "2560-dev-s5-homework-tf-state"
#     key            = "vpc/s5/bk/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "2560-dev-s5-homework-tf-state-lock"
#   }
# }
