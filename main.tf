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
  domain   = var.domain
}

