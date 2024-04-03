resource "aws_key_pair" "deployer" {
  key_name   = "terraform-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCi6bE6PoHycGUkPoejnUWQ4jWC9tP64pr6mW0qXoM11P7d5sJq2k9Iaf2aT+ARalrSiYp+UxeQ1BTi0tIT2DMM+AifBPYlLMoFpdKuLERFBYKxzBT1D9BfeBKeJrPLSw+CHNLRQhMMOOe4acm+4XVk6ED3FMaJSWUvqI1J0Al3hVW4pLIrevEuP9ga54avLRVFIZF/JuVvNPbSvsXF2uKg0sQwwG5RxaS9zehhUL4jTI5L/ZDbePwRGGrX6TBCsHJVxZW92qapOQ/bwouo8LmFy/A8GMbZ4GqX2SsOjvCwSSPObHR/WnApNUEfi5WZw7S57yivKd66ITqLRFc75Tib maruti@maruti-HP-Laptop-15-bs1xx"
}

resource "aws_instance" "my_vm" {
 ami           = var.ami //Ubuntu AMI
 instance_type = var.instance_type
 key_name      = aws_key_pair.deployer.key_name
 count         = 3

 tags = {
   Name = var.name_tag,
 }
}

resource "aws_eip" "lb" {
  instance = aws_instance.my_vm.id
  domain   = var.sg_name
}


resource "aws_security_group" "example" {
  name        = var.sg_name
  description = "Allow inbound traffic on port 80 and 22"
  vpc_id = aws_vpc.main.id  # Reference the ID of the VPC created above

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.ingress1_cidr_ipv4  # Allow traffic from any source on port 80
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ingress2_cidr_ipv4  # Allow traffic from any source on port 22 (SSH)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = var.egress1_cidr_blocks
  }

  tags = {
    Name = "security-group"
  }
}
