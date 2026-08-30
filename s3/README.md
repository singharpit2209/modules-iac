# S3 module

S3 bucket with encryption, public access block, and optional versioning.

## Example

```hcl
module "artifacts" {
  source = "git::https://github.com/singharpit2209/modules-iac.git//s3?ref=v1.0.0"

  project_name = "my-app"
  environment  = "dev"
  aws_region   = "us-east-1"
  bucket_name  = "my-app-dev-artifacts-371281943190"
}
```
