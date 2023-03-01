aws_security_group_name = "My test SG"
ami = "ami-0557a15b87f6559cf"
ec2_instance_count = 5
key_pair_name = "aws-ec2-inst"
instance_type = "t2.medium"
allow_tcp_ports = [22, 80, 443, 9345, 6443, 2379, 2380, 10250, 4240, 179, 5473, 9098, 9099]
allow_udp_ports = [8472, 4789, 8472, 51820, 51821]