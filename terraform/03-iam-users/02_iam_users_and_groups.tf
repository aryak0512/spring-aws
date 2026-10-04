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

// creates bunch of users
resource "aws_iam_user" "architect" {
  count = 5
  name  = "architect-${count.index + 1}"
}

// the group to which the users will be added
resource "aws_iam_group" "architects" {
  name = "architects"
}

// attaches the users to the group
resource "aws_iam_user_group_membership" "architect_membership" {
  count = 5
  user  = aws_iam_user.architect[count.index].name
  groups = [
    aws_iam_group.architects.name
  ]
}

// attaches the policy to the users
resource "aws_iam_user_policy" "policy" {
  count  = 5
  policy = file("./s3_and_ec2_full_permissions.json")
  user   = aws_iam_user.architect[count.index].name
}
