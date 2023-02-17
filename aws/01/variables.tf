variable "aws_security_group_name" {
  description = "AWS SG Name"
  type = string
  default = null
}

variable "ami" {
  description = "AMI image to apply"
  type = string
  default = null
}