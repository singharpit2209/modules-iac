output "api_id" {
  description = "HTTP API ID."
  value       = aws_apigatewayv2_api.this.id
}

output "api_endpoint" {
  description = "Base invoke URL for the stage."
  value       = aws_apigatewayv2_stage.this.invoke_url
}

output "execution_arn" {
  description = "API execution ARN."
  value       = aws_apigatewayv2_api.this.execution_arn
}

output "stage_name" {
  description = "Deployed stage name."
  value       = aws_apigatewayv2_stage.this.name
}
