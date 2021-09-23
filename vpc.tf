resource "aws_vpc" "sandbox-vpc" {
  cidr_block = var.VPC_CIDR
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support = var.enable_dns_support
  instance_tenancy = "default"
  tags = merge(
  local.common_tags,
  {"Name" = "VPC RAC"
   "env" = "var.env"}
  )
}

resource "aws_internet_gateway" "sandbox-igw" {
    vpc_id = "${aws_vpc.sandbox-vpc.id}"
    tags = merge(
    local.common_tags,
    {"Name" = "IGW RAC"
    "env" = "var.env"}
  )
}



resource "aws_subnet" "sandbox-publicsubnet1" {
  map_public_ip_on_launch = "true"
  vpc_id = "${aws_vpc.sandbox-vpc.id}"
  cidr_block = var.Public_subnet_CIDR_1
  availability_zone = var.Public_subnet_AZS_1
  tags = merge(
  local.common_tags,
  {"Name" = "VPC RAC"
   "env" = "var.env"}
  )

  
}

resource "aws_route_table" "sandbox-public-routetable" {
    vpc_id = "${aws_vpc.sandbox-vpc.id}"
    
    route {
        cidr_block = "0.0.0.0/0" 
        gateway_id = "${aws_internet_gateway.sandbox-igw.id}" 
    }
  }

resource "aws_route_table_association" "rts-public-subnet-1"{
    subnet_id = "${aws_subnet.sandbox-publicsubnet1.id}"
    route_table_id = "${aws_route_table.sandbox-public-routetable.id}"
}