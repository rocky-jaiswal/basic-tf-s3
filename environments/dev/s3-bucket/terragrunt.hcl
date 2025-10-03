include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules/s3-bucket"
}

locals {
  secrets = try(yamldecode(file(find_in_parent_folders("secrets.yaml"))), {})
}

inputs = merge(
  {
    bucket_name = "my-s3-test-tg-dev-bucket"
    environment = "dev"
  },
  local.secrets
)
