# not mandatory for official providers, reqd only for partner
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

variable "environment" {
  default = "dev"
}

variable "region" {
  default = "ap-south-1"
}

variable "securityGroups" {
  type    = list(string)
  default = ["sg-093aef4f7aa0c2063", "sg-0d18005e0325997d1"]
}

variable "myTags" {
  type = map(string)
  default = {
    "Dept" = "Engg"
    "Name" = "Aryak"
  }
}
