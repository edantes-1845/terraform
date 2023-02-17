resource "aws_instance" "ec2" {
  count = var.ec2_instance_count
  
  ami           = var.ami
  instance_type = var.instance_type
  key_name = var.key_pair_name

  tags = {
    "Name" = "linux-${count.index}"
    owner  = "alexander"
  }
  vpc_security_group_ids = [aws_security_group.access.id]

}

resource "aws_security_group" "access" {
  name        = var.aws_security_group_name
  description = "Allow traffic"

  dynamic "ingress" {
    for_each = var.allow_tcp_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] 
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_traffic"
  }
}