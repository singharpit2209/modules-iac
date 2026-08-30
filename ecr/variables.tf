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

variable "repository_name" {
  description = "ECR repository name."
  type        = string
}

variable "image_tag_mutability" {
  description = "MUTABLE or IMMUTABLE."
  type        = string
  default     = "IMMUTABLE"
}

variable "scan_on_push" {
  description = "Enable image scan on push."
  type        = bool
  default     = true
}

variable "force_delete" {
  description = "Delete repository even if it contains images."
  type        = bool
  default     = true
}

variable "lifecycle_policy" {
  description = "Optional ECR lifecycle policy JSON."
  type        = string
  default     = null
}

variable "tags" {
  description = "Additional tags."
  type        = map(string)
  default     = {}
}
