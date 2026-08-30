data "aws_iam_policy_document" "lambda_assume" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "lambda" {
  name               = "${var.function_name}-role"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume.json

  tags = merge(local.default_tags, {
    Name = "${var.function_name}-role"
  })
}

resource "aws_iam_role_policy_attachment" "basic_execution" {
  role       = aws_iam_role.lambda.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy" "additional" {
  count = var.additional_policy_json != null ? 1 : 0

  name   = "${var.function_name}-additional"
  role   = aws_iam_role.lambda.id
  policy = var.additional_policy_json
}

resource "aws_lambda_permission" "allow_invoke" {
  for_each = { for t in var.allowed_triggers : t.statement_id => t }

  statement_id  = each.value.statement_id
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.function_name
  principal     = each.value.principal
  source_arn    = each.value.source_arn
}
