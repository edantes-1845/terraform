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

variable "instance_type" {
  description = "EC2 instance type"
  type = string
}

variable "allow_tcp_ports" {
  description = "TCP ports"
  type = list(number)
}

variable "allow_udp_ports" {
  description = "UDP ports"
  type = list(number)
}