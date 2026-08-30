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

variable "queue_name" {
  description = "SQS queue name."
  type        = string
}

variable "visibility_timeout_seconds" {
  description = "Visibility timeout."
  type        = number
  default     = 30
}

variable "message_retention_seconds" {
  description = "Message retention period."
  type        = number
  default     = 345600
}

variable "create_dlq" {
  description = "Create a dead-letter queue and redrive policy."
  type        = bool
  default     = false
}

variable "max_receive_count" {
  description = "Max receives before DLQ (when create_dlq is true)."
  type        = number
  default     = 5
}

variable "tags" {
  description = "Additional tags merged into default tags."
  type        = map(string)
  default     = {}
}
