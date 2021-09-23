resource "aws_security_group" "ec2-sg" {
  name        = "RAC_SG_EC2"
  description = "SG FOR EC2 Instance"
  vpc_id = "${aws_vpc.sandbox-vpc.id}"
  ingress {
    description = "Allow Port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.security_group_CIDR_range
  }

  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.security_group_CIDR_range
  }
  egress {
    description = "Allow all ip and ports "
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

   tags = merge(
  local.common_tags,
  {"Name" = "RAC SG"
   "env" = "var.env"}
  )
   
}