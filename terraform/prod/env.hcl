# Set environment-wide variables. These are automatically pulled in to configure the remote state bucket in the root
# terragrunt.hcl configuration.
locals {
  environment_tags = {
    environment = "prod"
  }
}
