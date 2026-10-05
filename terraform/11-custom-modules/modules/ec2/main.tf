terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.17.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "vm1" {
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Name = "My first VM from a Terraform module"
  }
}

variable "ami" {
  description = "The AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type to use"
  type        = string
}

variable "region" {
  default = ""
}
