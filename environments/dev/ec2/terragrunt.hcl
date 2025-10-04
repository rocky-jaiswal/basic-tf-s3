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
  environment             = "dev"
  instance_type           = "t3.micro"
  vpc_id                  = dependency.vpc.outputs.vpc_id
  vpc_cidr                = dependency.vpc.outputs.vpc_cidr
  public_subnet_ids       = dependency.vpc.outputs.public_subnet_ids
  private_subnet_ids      = dependency.vpc.outputs.private_subnet_ids
  public_instance_count   = 1
  private_instance_count  = 1
  public_ssh_key          = "ssh-ed25519 XXX rocky.jaiswal@gmail.com"
}
