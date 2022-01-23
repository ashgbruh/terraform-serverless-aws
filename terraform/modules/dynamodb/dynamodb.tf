resource "aws_dynamodb_table" "dynamodb_table" {
  name           = "ProductCatalog"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "Id"

  attribute {
    name = "Id"
    type = "N"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }

  tags = merge(
    local.tags,
    {
      "Name"        = "${local.tags["project"]}-${local.tags["environment"]}-dynamodb",
      "description" = "${local.tags["project"]} ${local.tags["environment"]}-dynamodb",
    }
  )
}