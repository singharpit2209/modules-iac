# API Gateway module

HTTP API (API Gateway v2) with Lambda proxy integration.

Wire with the `lambda` module outputs: `invoke_arn` and `function_name`.

## Example

```hcl
module "api" {
  source = "git::https://github.com/singharpit2209/modules-iac.git//apigateway?ref=v1.0.0"

  project_name         = "my-app"
  environment          = "dev"
  aws_region           = "us-east-1"
  api_name             = "my-app-dev-http"
  lambda_invoke_arn    = module.api_lambda.invoke_arn
  lambda_function_name = module.api_lambda.function_name
}
```

## Outputs

| Name | Description |
|---|---|
| `api_endpoint` | HTTPS invoke URL |
| `api_id` | API ID |
