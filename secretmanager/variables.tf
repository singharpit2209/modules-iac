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

variable "secret_name" {
  description = "Secrets Manager secret name or path."
  type        = string
}

variable "description" {
  description = "Secret description."
  type        = string
  default     = ""
}

variable "secret_string" {
  description = "Initial secret value. Pass via CI or tfvars — never commit real secrets."
  type        = string
  sensitive   = true
  default     = null
}

variable "recovery_window_in_days" {
  description = "Days before secret deletion (0 for immediate)."
  type        = number
  default     = 7
}

variable "tags" {
  description = "Additional tags merged into default tags."
  type        = map(string)
  default     = {}
}
