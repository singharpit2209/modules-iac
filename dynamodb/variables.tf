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

variable "table_name" {
  description = "DynamoDB table name."
  type        = string
}

variable "hash_key" {
  description = "Partition key name."
  type        = string
}

variable "hash_key_type" {
  description = "Partition key type (S, N, B)."
  type        = string
  default     = "S"
}

variable "range_key" {
  description = "Optional sort key name."
  type        = string
  default     = null
}

variable "range_key_type" {
  description = "Sort key type (S, N, B)."
  type        = string
  default     = "S"
}

variable "billing_mode" {
  description = "PROVISIONED or PAY_PER_REQUEST."
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "read_capacity" {
  description = "Read capacity when billing_mode is PROVISIONED."
  type        = number
  default     = null
}

variable "write_capacity" {
  description = "Write capacity when billing_mode is PROVISIONED."
  type        = number
  default     = null
}

variable "enable_point_in_time_recovery" {
  description = "Enable PITR."
  type        = bool
  default     = false
}

variable "enable_alarms" {
  description = "Create CloudWatch alarms for throttled requests."
  type        = bool
  default     = false
}

variable "alarm_sns_topic_arn" {
  description = "SNS topic ARN for alarms (required when enable_alarms is true)."
  type        = string
  default     = null
}

variable "tags" {
  description = "Additional tags merged into default tags."
  type        = map(string)
  default     = {}
}
