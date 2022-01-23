resource "aws_iam_role" "get_data" {
  assume_role_policy   = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}

EOF
  name              = "${local.tags["project"]}-${local.tags["environment"]}-lambda"
  tags = merge(
    local.tags,
    {
      "Name"        = "${local.tags["project"]}-${local.tags["environment"]}-lambda",
      "description" = "IAM role for Lambda ${local.tags["project"]} ${local.tags["environment"]}",
    }
  )
}

data "aws_iam_policy_document" "get_data_policy" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = [
      "*"
    ]
  }
  statement {
    actions = [
      "dynamodb:GetItem"
    ]
    resources = [
      "*"
    ]
  }
}

resource "aws_iam_role_policy" "get_data" {
  name   = "${local.tags["project"]}-${local.tags["environment"]}-lambda-get-policy"
  policy = data.aws_iam_policy_document.get_data_policy.json
  role   = aws_iam_role.get_data.id
}