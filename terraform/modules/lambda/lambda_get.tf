data "aws_caller_identity" "current" {}

data "archive_file" "get_data" {
  output_path = "get_data.zip"
  source_file = "src/get_data.py"
  type        = "zip"
}

resource "aws_lambda_function" "get_data" {
  description = "lambda function for ${local.tags["project"]} ${local.tags["environment"]}"
  environment {
    variables = {
      #checkov:skip=CKV_AWS_173:vars not sensitive so no encryption required
      TABLE_NAME = var.table_name
    }
  }
  function_name                  = "${local.tags["project"]}-${local.tags["environment"]}-lambda"
  filename                       = data.archive_file.get_data.output_path
  handler                        = "get_data.lambda_handler"
  memory_size                    = var.lambda_memory_size
  reserved_concurrent_executions = var.reserved_concurrent_executions
  role                           = aws_iam_role.get_data.arn
  runtime                        = "python3.8"
  source_code_hash               = data.archive_file.get_data.output_base64sha256
  tags = merge(
    local.tags,
    {
      "description" = "lambda function for ${local.tags["project"]} ${local.tags["environment"]}",
      "Name"        = "${local.tags["project"]}-${local.tags["environment"]}-lambda",
    }
  )
  timeout = var.lambda_timeout
  tracing_config {
    mode = "PassThrough"
  }
}

resource "aws_cloudwatch_log_group" "loggroup" {
  name              = "/aws/lambda/${aws_lambda_function.get_data.function_name}"
  retention_in_days = var.log_retention_days
}
