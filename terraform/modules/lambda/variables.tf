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


variable "table_name" {
  description = "dynamodb table name"
  type        = string
}


variable "lambda_memory_size" {
  description = "memory allocated to the lambda function"
  type        = number
}

variable "lambda_timeout" {
  description = "timeout for lambda function"
  type        = number
}

variable "log_retention_days" {
  default     = 7
  description = "lambda cloudwatch log retention in days"
  type        = number
}


variable "reserved_concurrent_executions" {
  default     = -1
  description = "number of concurrent executions. defaults to unlimited"
  type        = number
}
