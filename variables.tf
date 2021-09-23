variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "us-east-1"
}

variable "env" {
  description = "choose which environment to deploy"
  type = string
  default = "dev"
}

variable "VPC_CIDR" {
  description = "VPC CIDR ID"
  type = string
  default = "10.0.0.0/16"
}


variable "Public_subnet_CIDR_1" {
  description = "Subnet CIDR"
  type = string
  default = "10.0.1.0/24"
}

variable "Public_subnet_AZS_1" {
  description = "public subnet 1 AZ"
  type = string
  default = "us-east-1a"
}

variable "instance_keypair" {
  description = "keypair value"
  type = string
  default = "RACkey"
}

variable "enable_dns_hostnames" {
  description = "enable_dns_hostnames"
  type = bool
  default = "true"
}

variable "enable_dns_support" {
  description = "enable_dns_support"
  type = bool
  default = "true"
}


variable "associate_public_ip_address" {
  description = "enable or disable public_ip"
  type = bool
  default = "true"
}

variable "instance_type_map" {
  description = "EC2 Instance Type"
  type = map(string)
  default = {
    "dev" = "t2.micro"
    "qa" = "t2.small"
    "prod" = "t2.large"
  }
}

variable "security_group_CIDR_range" {
  description = "Security Group CIDR Range"
  type = list(string)
  default = ["0.0.0.0/0", "172.7.1.0/24"]
}

variable "ami" {
  description = "ami ids"
  type = string
  default = "ami-087c17d1fe0178315"
    
}
