
# resource "aws_iam_user" "architect" {
#   count = 4
#   name  = "architect-${count.index + 1}"
# }
#
# data "aws_iam_group" "architects" {
#   group_name = "architects"
# }

# resource "aws_iam_user_group_membership" "architects" {
#   count = 4
#   user  = aws_iam_user.architect[count.index].name
#   groups = [
#     data.aws_iam_group.architects.group_name
#   ]
# }
