##################
# Lambda Function
##################
output "lambda_function_arn" {
  description = "The ARN of the Lambda Function"
  value       = aws_lambda_function.get_data.arn
}

output "lambda_function_invoke_arn" {
  description = "The Invoke ARN of the Lambda Function"
  value       = aws_lambda_function.get_data.invoke_arn
}

output "lambda_function_name" {
  description = "The name of the Lambda Function"
  value       = aws_lambda_function.get_data.function_name
}


# output "lambda_function_version" {
#   description = "Latest published version of Lambda Function"
#   value       = aws_lambda_function.serverless.lambda_function_version
# }


# ###############
# # API Gateway
# ###############
# output "apigatewayv2_api_id" {
#   description = "The API identifier"
#   value       = aws_lambda_function.api_gateway.apigatewayv2_api_id
# }

# output "apigatewayv2_api_api_endpoint" {
#   description = "The URI of the API"
#   value       = aws_lambda_function.api_gateway.apigatewayv2_api_api_endpoint
# }

# output "apigatewayv2_api_arn" {
#   description = "The ARN of the API"
#   value       = aws_lambda_function.api_gateway.apigatewayv2_api_arn
# }

# output "apigatewayv2_api_execution_arn" {
#   description = "The ARN prefix to be used in an aws_lambda_permission's source_arn attribute or in an aws_iam_policy to authorize access to the @connections API."
#   value       = aws_lambda_function.api_gateway.apigatewayv2_api_execution_arn
# }

# output "default_apigatewayv2_stage_execution_arn" {
#   description = "The ARN prefix to be used in an aws_lambda_permission's source_arn attribute or in an aws_iam_policy to authorize access to the @connections API."
#   value       = aws_lambda_function.api_gateway.default_apigatewayv2_stage_execution_arn
# }


# #################
# # DynamoDB Table
# #################
# output "dynamodb_table_arn" {
#   description = "ARN of the DynamoDB table"
#   value       = aws_lambda_function.dynamodb_table.dynamodb_table_arn
# }

# output "dynamodb_table_id" {
#   description = "ID of the DynamoDB table"
#   value       = aws_lambda_function.dynamodb_table.dynamodb_table_id
# }

# # API Gateway - Domain name
# output "apigatewayv2_domain_name_id" {
#   description = "The domain name identifier"
#   value       = aws_lambda_function.api_gateway.apigatewayv2_domain_name_id
# }

# output "apigatewayv2_domain_name_configuration" {
#   description = "The domain name configuration"
#   value       = aws_lambda_function.api_gateway.apigatewayv2_domain_name_configuration
# }

# output "apigatewayv2_target_domain_name" {
#   description = "The target domain name"
#   value       = aws_lambda_function.api_gateway.apigatewayv2_domain_name_target_domain_name
# }

# output "apigatewayv2_hosted_zone_id" {
#   description = "The Amazon Route 53 Hosted Zone ID of the endpoint"
#   value       = aws_lambda_function.api_gateway.apigatewayv2_domain_name_hosted_zone_id
# }

# # CLI command
# output "command" {
#   description = "CLI command to call API Gateway"
#   value       = "http GET ${aws_lambda_function.api_gateway.apigatewayv2_api_api_endpoint}"
# }
