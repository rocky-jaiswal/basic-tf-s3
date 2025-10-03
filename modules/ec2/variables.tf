variable "environment" {
  type        = string
  description = "Environment name"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block"
}

variable "public_subnet_id" {
  type        = string
  description = "Public subnet ID"
}

variable "private_subnet_id" {
  type        = string
  description = "Private subnet ID"
}

variable "public_instance_count" {
  type        = number
  description = "Number of public instances"
  default     = 2
}

variable "private_instance_count" {
  type        = number
  description = "Number of private instances"
  default     = 2
}

variable "region" {
  type    = string
  default = "eu-central-1"
}