# Terragrunt Sample Project

## Apply single module in dev

cd environments/dev/s3
terragrunt apply

cd environments/dev/vpc
terragrunt apply

## Apply with dependencies (VPC first, then EC2)

cd environments/dev/ec2
terragrunt apply # Automatically applies VPC first!

## Apply ALL modules in dev environment

cd environments/dev
terragrunt run-all apply

## Apply specific modules only

cd environments/dev
terragrunt run-all apply --terragrunt-include-dir vpc --terragrunt-include-dir ec2

## Plan all modules in dev

cd environments/dev
terragrunt run-all plan

## Apply everything (all environments, all modules)

terragrunt run-all apply
