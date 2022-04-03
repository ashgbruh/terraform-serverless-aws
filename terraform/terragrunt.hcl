# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# Terragrunt is a thin wrapper for Terraform that provides extra tools for working with multiple Terraform modules,
# remote state, and locking: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------

locals {
  common_vars      = read_terragrunt_config(find_in_parent_folders("common.hcl"))
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  # Extract the variables we need for easy access
  # account_id  = local.environment_vars.locals.aws_account_id
  environment = local.environment_vars.locals.environment_tags.environment
  region      = local.common_vars.locals.region
}

# Generate an AWS provider block
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
  provider "aws" {
  region  = "${local.region}"
}
EOF
}

# Configure Terragrunt to automatically store tfstate files in an S3 bucket
remote_state {
  backend = "s3"
  config = {
    encrypt        = true
    bucket         = "tmp-${local.environment}-terraform-state-files"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.region
    dynamodb_table = "tmp-${local.environment}-terraform-state"

    s3_bucket_tags = {
      costcentre  = "${local.common_vars.locals.common_tags.costcentre}"
      environment = "${local.environment}"
      live        = "${local.common_vars.locals.common_tags.live}"
      owner       = "${local.common_vars.locals.common_tags.owner}"
    }

    dynamodb_table_tags = {
      costcentre  = "${local.common_vars.locals.common_tags.costcentre}"
      environment = "${local.environment}"
      live        = "${local.common_vars.locals.common_tags.live}"
      owner       = "${local.common_vars.locals.common_tags.owner}"
    }
  }

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

# Configure root level variables that all resources can inherit. This is especially helpful with multi-account configs
# where terraform_remote_state data sources are placed directly into the modules.
inputs = merge(
  local.common_vars.locals,
  local.environment_vars.locals,
)
