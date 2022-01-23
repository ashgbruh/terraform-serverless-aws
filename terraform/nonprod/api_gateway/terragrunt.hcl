
dependency "lambda" {
  config_path = "../lambda"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  lambda_function_name = dependency.lambda.outputs.lambda_function_name
  integration_uri = dependency.lambda.outputs.lambda_function_invoke_arn
}

locals {
  common_vars = read_terragrunt_config(find_in_parent_folders("common.hcl"))
}


terraform {
  source = "../../modules//api_gateway"
}
