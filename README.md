# Layer 3 — modules-iac

Reusable Terraform **child modules** for AWS application resources. This repo is a **library only** — it does not deploy AWS resources by itself and does not use a Terraform backend.

## Module catalog

| Module | Purpose |
|---|---|
| [`iam/`](iam/) | IAM role with trust policy and optional inline/managed policies |
| [`s3/`](s3/) | S3 bucket with encryption and public access block |
| [`lambda/`](lambda/) | Lambda function, execution role, CloudWatch logs, optional `live` alias |
| [`apigateway/`](apigateway/) | HTTP API (v2), stage, Lambda proxy integration |
| [`ecr/`](ecr/) | ECR repository with scan-on-push (v1.1.0+) |
| [`ecs/`](ecs/) | ECS Fargate cluster/service with bootstrap task def (v1.1.0+) |
| [`dynamodb/`](dynamodb/) | DynamoDB table with optional alarms |
| [`sqs/`](sqs/) | SQS queue with optional DLQ |
| [`sns/`](sns/) | SNS topic |
| [`secretmanager/`](secretmanager/) | Secrets Manager secret |

Platform stacks (KMS, VPC, DNS) live in [`core-iac`](../core-iac/). App infrastructure uses [`hello-world-iac`](../hello-world-iac/).

## v1.1.0 highlights

- **Lambda bootstrap mode** — set `bootstrap_zip_path` to a committed stub; deploy real code via CD workflows
- **ECR / ECS modules** — ready for container stacks (used when you add ECS infra)

## Conventions

- Each folder is an independent Terraform module (no `backend` block).
- Common inputs: `project_name`, `environment`, `aws_region`, `tags`.
- Pin module versions with git tags (`v1.0.0`, `v1.1.0`).

## Usage

Reference a module from another repo:

```hcl
module "api_lambda" {
  source = "git::https://github.com/singharpit2209/modules-iac.git//lambda?ref=v1.1.0"

  project_name       = "my-app"
  environment        = "dev"
  aws_region         = "us-east-1"
  function_name      = "my-app-dev-api"
  runtime            = "python3.12"
  handler            = "index.handler"
  bootstrap_zip_path = "${path.module}/bootstrap/lambda.zip"
}
```

## CI

**Validate** workflow runs on push/PR: `terraform fmt -check` and `terraform validate` per module. No AWS OIDC role required.

## GitHub

Push to `singharpit2209/modules-iac` (public recommended). Tag releases after changes: `git tag v1.1.0 && git push origin v1.1.0`.
