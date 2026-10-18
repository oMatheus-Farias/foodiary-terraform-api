output "arn" {
  description = "ARN of the Lambda function."
  value       = aws_lambda_function.this.arn
}

output "function_name" {
  description = "Name of the Lambda function."
  value       = aws_lambda_function.this.function_name
}

output "invoke_arn" {
  description = "Invoke ARN used by API Gateway integrations."
  value       = aws_lambda_function.this.invoke_arn
}

output "execution_role_name" {
  description = "Name of the function's dedicated IAM execution role."
  value       = aws_iam_role.execution.name
}
