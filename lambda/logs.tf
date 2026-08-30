resource "aws_cloudwatch_log_group" "lambda" {
  name              = "/aws/lambda/${var.function_name}"
  retention_in_days = var.log_retention_in_days

  tags = merge(local.default_tags, {
    Name = "/aws/lambda/${var.function_name}"
  })
}
