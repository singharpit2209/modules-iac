# DynamoDB module

DynamoDB table with on-demand billing by default and optional CloudWatch alarms.

## Example

```hcl
module "items" {
  source = "git::https://github.com/singharpit2209/modules-iac.git//dynamodb?ref=v1.0.0"

  project_name = "my-app"
  environment  = "dev"
  aws_region   = "us-east-1"
  table_name   = "my-app-dev-items"
  hash_key     = "pk"
}
```
