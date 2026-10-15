# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_subnet" "subnet_b" {
  assign_ipv6_address_on_creation                = false
  availability_zone                              = "ap-south-1b"
  availability_zone_id                           = "aps1-az3"
  cidr_block                                     = "10.77.2.0/24"
  customer_owned_ipv4_pool                       = null
  enable_dns64                                   = false
  enable_lni_at_device_index                     = 0
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_cidr_block                                = null
  ipv6_native                                    = false
  map_customer_owned_ip_on_launch                = false
  map_public_ip_on_launch                        = false
  outpost_arn                                    = null
  private_dns_hostname_type_on_launch            = "ip-name"
  region                                         = "ap-south-1"
  tags = {
    Name = "subnet02"
  }
  tags_all = {
    Name = "subnet02"
  }
  vpc_id = "vpc-0ef19cbb14752dd02"
}

# __generated__ by Terraform
resource "aws_subnet" "subnet_c" {
  assign_ipv6_address_on_creation                = false
  availability_zone                              = "ap-south-1c"
  availability_zone_id                           = "aps1-az2"
  cidr_block                                     = "10.77.3.0/24"
  customer_owned_ipv4_pool                       = null
  enable_dns64                                   = false
  enable_lni_at_device_index                     = 0
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_cidr_block                                = null
  ipv6_native                                    = false
  map_customer_owned_ip_on_launch                = false
  map_public_ip_on_launch                        = false
  outpost_arn                                    = null
  private_dns_hostname_type_on_launch            = "ip-name"
  region                                         = "ap-south-1"
  tags = {
    Name = "subnet03"
  }
  tags_all = {
    Name = "subnet03"
  }
  vpc_id = "vpc-0ef19cbb14752dd02"
}

# __generated__ by Terraform
resource "aws_subnet" "subnet_a" {
  assign_ipv6_address_on_creation                = false
  availability_zone                              = "ap-south-1a"
  availability_zone_id                           = "aps1-az1"
  cidr_block                                     = "10.77.1.0/24"
  customer_owned_ipv4_pool                       = null
  enable_dns64                                   = false
  enable_lni_at_device_index                     = 0
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_cidr_block                                = null
  ipv6_native                                    = false
  map_customer_owned_ip_on_launch                = false
  map_public_ip_on_launch                        = false
  outpost_arn                                    = null
  private_dns_hostname_type_on_launch            = "ip-name"
  region                                         = "ap-south-1"
  tags = {
    Name = "subnet01"
  }
  tags_all = {
    Name = "subnet01"
  }
  vpc_id = "vpc-0ef19cbb14752dd02"
}
