output "api_id" {
  description = "ID of the HTTP API."
  value       = aws_apigatewayv2_api.main.id
}

output "execution_arn" {
  description = "Execution ARN used to scope API Gateway Lambda permissions."
  value       = aws_apigatewayv2_api.main.execution_arn
}

output "invoke_url" {
  description = "Invoke URL of the deployed API stage."
  value       = aws_apigatewayv2_stage.main.invoke_url
}

output "stage_name" {
  description = "Name of the deployed API stage."
  value       = aws_apigatewayv2_stage.main.name
}
