terraform {
  backend "s3" {
    bucket       = "my-s3-dev-terraform-state-bucket"
    key          = "env/${terraform.workspace}/terraform.tfstate"
    region       = "eu-central-1"
    use_lockfile = true
  }
  required_version = ">= 1.0"
}

provider "aws" {
  region = var.region
}

variable "region" {
  default = "eu-central-1"
}

variable "environment" {
  type = string
}

variable "bucket_name" {
  type = string
}

module "s3_bucket" {
  source      = "./../../modules/s3-bucket"
  bucket_name = var.bucket_name
  environment = var.environment
}
