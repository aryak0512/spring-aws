terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.17.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "vm" {
  ami           = "ami-01a00762f46d584a1"
  instance_type = "t2.micro"

  // the lifecycle meta argument
  lifecycle {
    ignore_changes = [tags] // would ignore any tags added manually via the aws console
  }

  tags = {
    Name = "vm"
  }
}
