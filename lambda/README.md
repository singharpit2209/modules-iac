# Lambda module

Lambda function with execution role, CloudWatch log group, and optional invoke permissions.

## Example

```hcl
module "api" {
  source = "git::https://github.com/singharpit2209/modules-iac.git//lambda?ref=v1.0.0"

  project_name  = "my-app"
  environment   = "dev"
  aws_region    = "us-east-1"
  function_name = "my-app-dev-api"
  runtime       = "python3.12"
  handler       = "index.handler"
  source_dir    = "${path.module}/src"
}
```

## Outputs

| Name | Description |
|---|---|
| `function_arn` | Function ARN |
| `invoke_arn` | Invoke ARN for API Gateway |
| `role_arn` | Execution role ARN |
