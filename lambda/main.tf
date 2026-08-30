locals {
  default_tags = merge(
    {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "terraform"
    },
    var.tags
  )

  use_bootstrap   = var.bootstrap_zip_path != null
  source_dir      = coalesce(var.source_dir, "${path.module}/placeholder")
  package_path    = local.use_bootstrap ? var.bootstrap_zip_path : data.archive_file.lambda[0].output_path
  package_hash    = local.use_bootstrap ? filebase64sha256(var.bootstrap_zip_path) : data.archive_file.lambda[0].output_base64sha256
}

data "archive_file" "lambda" {
  count = local.use_bootstrap ? 0 : 1

  type        = "zip"
  source_dir  = local.source_dir
  output_path = "${path.module}/.build/${var.function_name}.zip"
}

resource "aws_lambda_function" "this" {
  function_name = var.function_name
  role          = aws_iam_role.lambda.arn
  runtime       = var.runtime
  handler       = var.handler
  memory_size   = var.memory_size
  timeout       = var.timeout

  filename         = local.package_path
  source_code_hash = local.package_hash

  environment {
    variables = var.environment_variables
  }

  depends_on = [aws_cloudwatch_log_group.lambda]

  tags = merge(local.default_tags, {
    Name = var.function_name
  })
}

resource "aws_lambda_alias" "live" {
  count = var.create_live_alias ? 1 : 0

  name             = var.live_alias_name
  description      = "Live alias updated by CD deploy workflows."
  function_name    = aws_lambda_function.this.function_name
  function_version = "$LATEST"
}
