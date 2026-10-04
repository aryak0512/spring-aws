# not mandatory for official providers, read only for partner
# and community providers
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

locals {
  CreationDate = "date-${formatdate("YYYY-MM-DD", timestamp())}"
}

resource "aws_security_group" "my-sg" {
  tags = {
    Name         = "my-sg"
    CreationDate = local.CreationDate
  }
}
