output "queue_url" {
  description = "SQS queue URL."
  value       = aws_sqs_queue.this.url
}

output "queue_arn" {
  description = "SQS queue ARN."
  value       = aws_sqs_queue.this.arn
}

output "dlq_arn" {
  description = "DLQ ARN when create_dlq is true."
  value       = var.create_dlq ? aws_sqs_queue.dlq[0].arn : null
}
