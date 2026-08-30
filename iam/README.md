# IAM module

Generic IAM role with optional inline policy and managed policy attachments.

## Example

```hcl
module "task_role" {
  source = "git::https://github.com/singharpit2209/modules-iac.git//iam?ref=v1.0.0"

  project_name            = "my-app"
  environment             = "dev"
  aws_region              = "us-east-1"
  role_name               = "my-app-dev-task"
  assume_role_policy_json = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "lambda.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  ]
}
```

## Outputs

| Name | Description |
|---|---|
| `role_arn` | Role ARN |
| `role_name` | Role name |
