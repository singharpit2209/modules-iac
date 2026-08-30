locals {
  default_tags = merge(
    {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "terraform"
    },
    var.tags
  )
}

resource "aws_sns_topic" "this" {
  name = var.topic_name

  tags = merge(local.default_tags, {
    Name = var.topic_name
  })
}
