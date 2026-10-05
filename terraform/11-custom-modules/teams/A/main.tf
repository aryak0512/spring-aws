module "ec2" {
  source        = "../../modules/ec2"
  instance_type = "t3.micro"
  ami           = "ami-01a00762f46d584a1"
  region        = "ap-south-1"
}
