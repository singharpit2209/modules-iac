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

variable "role_name" {
  description = "IAM role name (without path)."
  type        = string
}

variable "assume_role_policy_json" {
  description = "JSON trust policy for the role."
  type        = string
}

variable "inline_policy_json" {
  description = "Optional inline policy JSON. Null to skip."
  type        = string
  default     = null
}

variable "managed_policy_arns" {
  description = "List of AWS managed policy ARNs to attach."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Additional tags merged into default tags."
  type        = map(string)
  default     = {}
}
