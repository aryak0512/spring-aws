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

import {
  to = aws_vpc.main
  id = "vpc-YOUR_VPC_ID"
}

import {
  to = aws_subnet.subnet_a
  id = "subnet-068589c4ffe726272"
}

import {
  to = aws_subnet.subnet_b
  id = "subnet-0edd52797e7b3fe4b"
}

import {
  to = aws_subnet.subnet_c
  id = "subnet-041b409b6c5b3433d"
}
