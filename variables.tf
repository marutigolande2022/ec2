variable "ami" {
   type        = string
   description = "Ubuntu AMI ID in N. Virginia Region"
}

variable "instance_type" {
   type        = string
   description = "Instance type"
}

variable "name_tag" {
   type        = string
   description = "Name of the EC2 instance"
}

variable "domain" {
   type        = string
   description = "Name of the EC2 instance"
}

variable "sg_name" {
   type        = string
   description = "Ubuntu AMI ID in N. Virginia Region"
}

variable "ingress1_cidr_ipv4" {
   type        = string
   description = "Ubuntu AMI ID in N. Virginia Region"
}

variable "ingress2_cidr_ipv4" {
   type        = string
   description = "Ubuntu AMI ID in N. Virginia Region"
}

variable "ingress1_cidr_ipv6" {
   type        = string
   description = "Ubuntu AMI ID in N. Virginia Region"
}

variable "egress1_cidr_blocks" {
   type        = string
   description = "Ubuntu AMI ID in N. Virginia Region"
}
