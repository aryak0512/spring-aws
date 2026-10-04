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

output "ami_id" {
  value = data.aws_ami.my_ami.image_id
}
