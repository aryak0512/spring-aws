
resource "aws_instance" "vm" {
  ami                    = "ami-01a00762f46d584a1"
  instance_type          = var.environment == "dev" && var.region == "ap-south-1" ? "t3.micro" : "t3.large"
  vpc_security_group_ids = var.securityGroups
  count                  = 2
  tags = {
    Name = "vm-${count.index + 1}"
  }
}
