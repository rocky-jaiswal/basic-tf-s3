# Terragrunt Sample Project

## Apply single module in dev

cd environments/dev/s3-bucket
terragrunt plan
terragrunt apply

## Plan / Apply ALL modules in dev environment

cd environments/dev
terragrunt plan --all
terragrunt apply --all

## Apply specific modules only

cd environments/dev
terragrunt plan --all --queue-include-dir=s3-bucket

## Apply everything (all environments, all modules)

terragrunt apply --all
