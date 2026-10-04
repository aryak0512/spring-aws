terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.17.0"
    }
  }
}
// fetches the latest ami of Ubuntu from the AWS account
data "aws_ami" "my_ami" {
  most_recent = true
  name_regex  = "^ubuntu/images/hvm-ssd/ubuntu-jammy-.*-amd64-server-.*"
  owners      = ["099720109477"] // filter by ubuntu account owner
}

// using the above fetched ami to create an EC2 instance
resource "aws_instance" "my_instance" {
  ami           = data.aws_ami.my_ami.image_id
  instance_type = "t2.micro"
  tags = {
    Name = "MyUbuntuInstance"
  }
}

output "ami_id" {
  value = data.aws_ami.my_ami.image_id
}
