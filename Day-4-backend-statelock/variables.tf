variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  type = string
}

variable "subnet_cidr" {
  type = string
}

variable "availability_zone" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "ami_id" {
  type = string
}

# variable "key_name" {
#   type = string
# }