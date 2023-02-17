output "ec2_public_ip" {
  description = "Public IP address"
  value = aws_instance.ec2[*].public_ip
}