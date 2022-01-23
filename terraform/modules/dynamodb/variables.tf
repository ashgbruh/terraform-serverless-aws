locals {
  tags = merge(var.common_tags, var.environment_tags)
}


variable "common_tags" {
  description = "Common tags for all the environments in the project."
  type        = map(string)
}

variable "environment_tags" {
  description = "Environment specific tags in the project."
  type        = map(string)
}
