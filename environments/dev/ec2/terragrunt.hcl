include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules/ec2"
}

dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  environment            = "dev"
  instance_type          = "t3.small"
  vpc_id                 = dependency.vpc.outputs.vpc_id
  vpc_cidr               = dependency.vpc.outputs.vpc_cidr
  public_subnet_id       = dependency.vpc.outputs.public_subnet_id
  private_subnet_id      = dependency.vpc.outputs.private_subnet_id
  public_instance_count  = 2
  private_instance_count = 2
}
