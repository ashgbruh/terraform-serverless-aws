# Set account-wide variables. These are automatically pulled in to configure the remote state bucket in the root
# terragrunt.hcl configuration.

locals {
  common_tags = {
    project    = "bw"
    owner      = "AG"
    email      = "ag@ag.com"
    costcentre = "costcentre"
    live       = "no"
  }
  region = "eu-west-1"
}
