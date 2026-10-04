terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.17.0"
    }
  }
}

variable "ports_to_be_allowed_inwards" {
  type    = list(number)
  default = [80, 443, 22]
}
locals {
  CreationDate = "date-${formatdate("YYYY-MM-DD", timestamp())}"
}

resource "aws_security_group" "dynamic-sg" {
  name = "dynamic-sg"
  tags = {
    Name         = "my-sg"
    CreationDate = local.CreationDate
  }
  dynamic "ingress" {
    for_each = var.ports_to_be_allowed_inwards
    content {
      from_port   = ingress.value // syntax gotcha!
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
