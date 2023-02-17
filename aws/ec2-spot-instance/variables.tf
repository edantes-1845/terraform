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

variable "key_pair_name" {
  description = "SSH Key pair name"
  type = string
}

variable "ec2_instance_count" {
  description = "Number of EC2 Spot instance"
  type = number
}