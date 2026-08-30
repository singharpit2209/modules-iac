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

variable "function_name" {
  description = "Lambda function name."
  type        = string
}

variable "runtime" {
  description = "Lambda runtime (e.g. python3.12, nodejs20.x)."
  type        = string
}

variable "handler" {
  description = "Lambda handler."
  type        = string
}

variable "source_dir" {
  description = "Directory containing Lambda source to zip. Defaults to module placeholder."
  type        = string
  default     = null
}

variable "memory_size" {
  description = "Memory in MB."
  type        = number
  default     = 128
}

variable "timeout" {
  description = "Timeout in seconds."
  type        = number
  default     = 30
}

variable "environment_variables" {
  description = "Environment variables for the function."
  type        = map(string)
  default     = {}
}

variable "additional_policy_json" {
  description = "Optional additional IAM policy JSON for the execution role."
  type        = string
  default     = null
}

variable "log_retention_in_days" {
  description = "CloudWatch log retention in days."
  type        = number
  default     = 14
}

variable "allowed_triggers" {
  description = "Optional Lambda invoke permissions (e.g. API Gateway)."
  type = list(object({
    statement_id = string
    principal    = string
    source_arn   = string
  }))
  default = []
}

variable "tags" {
  description = "Additional tags merged into default tags."
  type        = map(string)
  default     = {}
}
