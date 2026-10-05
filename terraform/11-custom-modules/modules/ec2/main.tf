provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "vm1" {
  ami           = "ami-01a00762f46d584a1"
  instance_type = "t3.micro"
  tags = {
    Name = "My first VM from a Terraform module"
  }
}
