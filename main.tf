#create ami id from instance.
resource "aws_ami_from_instance" "example" {
  name               = var.instance_name
  source_instance_id = var.source_instance_id
}

#copy ami from another region
resource "aws_ami_copy" "example" {
  name              = "terraform-example"
  description       = "A copy of ami-xxxxxxxx"
  source_ami_id     = "ami-xxxxxxxx"
  source_ami_region = "us-west-1"

  tags = {
    Name = "HelloWorld"
  }
}

#copy ami to another account.
resource "aws_ami_launch_permission" "example" {
  image_id   = "ami-12345678"
  account_id = "123456789012"
}
