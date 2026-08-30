variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "service_name" {
  type = string
}

variable "task_definition_family" {
  type = string
}

variable "container_name" {
  type = string
}

variable "container_port" {
  type    = number
  default = 8080
}

variable "bootstrap_image" {
  description = "Placeholder image for initial create; replaced by deploy-ecs workflow."
  type        = string
  default     = "public.ecr.aws/docker/library/nginx:alpine"
}

variable "cpu" {
  type    = string
  default = "256"
}

variable "memory" {
  type    = string
  default = "512"
}

variable "desired_count" {
  type    = number
  default = 0
}

variable "subnet_ids" {
  type    = list(string)
  default = null
}

variable "security_group_ids" {
  type    = list(string)
  default = null
}

variable "assign_public_ip" {
  type    = bool
  default = true
}

variable "target_group_arn" {
  type    = string
  default = null
}

variable "log_retention_in_days" {
  type    = number
  default = 14
}

variable "tags" {
  type    = map(string)
  default = {}
}
