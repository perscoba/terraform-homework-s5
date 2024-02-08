provider "aws" {
  region = var.aws_region
}

# terraform blocks

terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}









resource "aws_instance" "example" {
  depends_on = [
    aws_security_group.example
  ]
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.example.id]
  tags                   = var.common_tags
  ebs_block_device {
    device_name = "/dev/sdf"
    volume_type = "gp2"
    volume_size = 10
  }
}


