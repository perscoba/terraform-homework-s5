resource "aws_security_group" "example" {
  name_prefix = "s5-bastion-sg"
  vpc_id      = "vpc-0e6aa9e07ebd581f4"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = var.common_tags
}
