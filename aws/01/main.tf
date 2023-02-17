resource "aws_instance" "ec2" {
  ami           = var.ami
  instance_type = "t2.micro"

  tags = {
    "Name" = "linux01"
    owner  = "alexander"
  }
  vpc_security_group_ids = [aws_security_group.http_access.id]

  user_data = <<EOF
#!/bin/bash
yum -y update
yum install -y httpd
sudo service httpd start 
EOF

}

resource "aws_security_group" "http_access" {
  name        = var.aws_security_group_name
  description = "Allow HTTP traffic"

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
    Name = "allow_http"
  }
}