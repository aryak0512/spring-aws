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

# VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "graph-vpc"
  }
}

# Subnet depends on VPC
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "graph-subnet"
  }
}

# Security Group depends on VPC
resource "aws_security_group" "web" {
  name   = "graph-web-sg"
  vpc_id = aws_vpc.main.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# IAM Role
resource "aws_iam_role" "ec2" {
  name = "graph-ec2-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

# Instance Profile depends on IAM Role
resource "aws_iam_instance_profile" "ec2" {
  name = "graph-ec2-profile"
  role = aws_iam_role.ec2.name
}

# S3 bucket
resource "aws_s3_bucket" "data" {
  bucket_prefix = "graph-example-"
}

# IAM policy depends on S3 bucket + IAM Role
resource "aws_iam_role_policy" "s3" {
  name = "s3-access"
  role = aws_iam_role.ec2.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = [
        "s3:GetObject",
        "s3:PutObject"
      ]
      Resource = "${aws_s3_bucket.data.arn}/*"
    }]
  })
}

# EC2 depends on:
# VPC subnet
# Security Group
# IAM Instance Profile
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.main.id
  vpc_security_group_ids = [
    aws_security_group.web.id
  ]
  iam_instance_profile = aws_iam_instance_profile.ec2.name
  tags = {
    Name = "graph-web-server"
  }
}
