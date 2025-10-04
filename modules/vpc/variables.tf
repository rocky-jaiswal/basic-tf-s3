variable "environment" {
  type        = string
  description = "Environment name"
}

variable "project_name" {
  description = "Project name for resource naming"
  type        = string
  default     = "app-k3s"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR block for public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  type        = string
  description = "CIDR block for private subnet"
  default     = "10.0.2.0/24"
}

variable "availability_zones" {
  type        = list(string)
  default     = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  description = "Availability zone"
}

variable "region" {
  type    = string
  default = "eu-central-1"
}
