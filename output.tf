output "ec2_publicip" {
  description = "EC2 Instance Public IP"
  value = aws_instance.RAC-EC2.public_ip
}

# EC2 Instance Public DNS
output "ec2_publicdns" {
  description = "EC2 Instance Public DNS"
  value = aws_instance.RAC-EC2.public_dns
}