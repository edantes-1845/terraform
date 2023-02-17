resource "aws_spot_instance_request" "ec2" {
  count = var.ec2_instance_count

  ami           = var.ami
  instance_type = "t2.micro"
  spot_price    = "0.03"

  tags = {
    "Name" = "Node-${count.index}"
    owner  = "dcops"
  }
  vpc_security_group_ids = [aws_security_group.http_access.id]

}

resource "aws_security_group" "http_access" {
  name        = var.aws_security_group_name
  description = "Allow incoming traffic"

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
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