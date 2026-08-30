# Secrets Manager module

Creates a secret and optional initial version. Do not commit real secret values to git.

## Example

```hcl
module "db_secret" {
  source = "git::https://github.com/singharpit2209/modules-iac.git//secretmanager?ref=v1.0.0"

  project_name  = "my-app"
  environment   = "dev"
  aws_region    = "us-east-1"
  secret_name   = "my-app/dev/db"
  secret_string = var.db_password # sensitive, from CI or local tfvars
}
```
