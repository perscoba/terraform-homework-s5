variable "aws_region_main" {
  type    = string
}

variable "aws_region_backup" {
  type    = string
  default = "us-west-1"
}

variable "common_tags" {
  type = map(any)

}
