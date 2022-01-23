dependency "dynamodb" {
  config_path = "../dynamodb"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  lambda_memory_size        = 128
  lambda_timeout            = 300
  table_name = dependency.dynamodb.outputs.dynamodb_table_id
}

locals {
  common_vars = read_terragrunt_config(find_in_parent_folders("common.hcl"))
}

terraform {
  source = "../../modules//lambda"
}





