terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.17.0"
    }
  }
}
provider "aws" {
  access_key = "xxx"
  secret_key = "xxx"
}

resource "aws_instance" "vm1" {
  ami           = "ami-01a00762f46d584a1"
  instance_type = "t3.micro"

  tags = {
    Name = "My first VM from Terraform"
  }
}
