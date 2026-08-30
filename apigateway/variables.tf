variable "project_name" {
  description = "Project name used in resource names and tags."
  type        = string
}

variable "environment" {
  description = "Environment label (dev, test, prod)."
  type        = string
}

variable "aws_region" {
  description = "AWS region."
  type        = string
}

variable "api_name" {
  description = "HTTP API name."
  type        = string
}

variable "stage_name" {
  description = "API stage name (e.g. dev, prod)."
  type        = string
  default     = "$default"
}

variable "route_key" {
  description = "Route key (e.g. $default, GET /hello)."
  type        = string
  default     = "$default"
}

variable "lambda_invoke_arn" {
  description = "Lambda invoke ARN from the lambda module output."
  type        = string
}

variable "lambda_function_name" {
  description = "Lambda function name (for invoke permission)."
  type        = string
}

variable "auto_deploy" {
  description = "Auto-deploy stage on API changes."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Additional tags merged into default tags."
  type        = map(string)
  default     = {}
}
