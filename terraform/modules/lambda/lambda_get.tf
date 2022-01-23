# module "lambda_get" {
#   source  = "terraform-aws-modules/lambda/aws"
#   version = "~> 2.0"

#   function_name = "${random_pet.this.id}-lambda-get"
#   description   = "My awesome Python lambda function"
#   handler       = "index.lambda_handler"
#   runtime       = "python3.8"
#   publish       = true

#   create_package = false
#   source_path = "../src/python-function/index.py"

#   # Free TACOS don't have Python available, so we can't build natively there.
#   #  source_path = "../src/python-function"
#   #  hash_extra  = "get"

#   attach_tracing_policy    = true
#   attach_policy_statements = true

#   policy_statements = {
#     dynamodb_read = {
#       effect    = "Allow",
#       actions   = ["dynamodb:GetItem"],
#       resources = [module.dynamodb_table.dynamodb_table_arn]
#     }
#   }

#   allowed_triggers = {
#     AllowExecutionFromAPIGateway = {
#       service    = "apigateway"
#       source_arn = "${module.api_gateway.apigatewayv2_api_execution_arn}/*/*/*"
#     }
#   }
# }


data "aws_caller_identity" "current" {}

data "archive_file" "get_data" {
  output_path = "get_data.zip"
  source_file = "src/get_data.py"
  type        = "zip"
}

resource "aws_lambda_function" "get_data" {
  description                    = "lambda function for ${local.tags["project"]} ${local.tags["environment"]}"
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

# resource "aws_cloudwatch_event_rule" "ami_cleanup" {
#   description         = "Scheduled cloudwatch Event for deleting amis"
#   name                = "${local.tags["project"]}-${local.tags["environment"]}-lambda-ami-cleanup-rule"
#   schedule_expression = "cron(${var.cron_expression})"
# }

# resource "aws_cloudwatch_event_target" "delete_ami" {
#   arn       = aws_lambda_function.get_data.arn
#   rule      = aws_cloudwatch_event_rule.ami_cleanup.name
#   target_id = aws_lambda_function.get_data.id
# }

# resource "aws_lambda_permission" "allow_cloudwatch_to_call" {
#   action        = "lambda:InvokeFunction"
#   function_name = aws_lambda_function.get_data.function_name
#   principal     = "events.amazonaws.com"
#   source_arn    = aws_cloudwatch_event_rule.ami_cleanup.arn
#   statement_id  = "${local.tags["project"]}-${local.tags["environment"]}-cloudwatch-lambda-permission"
# }