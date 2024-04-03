# values of variable.tf files defined here
ami             = "ami-05c969369880fa2c2"
instance_type   = "t2.micro"
name_tag        = "demo"
domain          = "vpc"
sg_name             = "my_sg"
ingress1_cidr_ipv4  = ["0.0.0.0/0"]
ingress2_cidr_ipv4  = ["0.0.0.0/0"]
ingress1_cidr_ipv6  = ["0.0.0.0/0"]
egress1_cidr_blocks = ["0.0.0.0/0"]
