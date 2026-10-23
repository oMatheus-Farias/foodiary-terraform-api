output "pre_sign_up_trigger_function_name" {
  description = "Name of the Cognito pre-sign-up trigger Lambda function."
  value       = module.pre_sign_up_trigger.function_name
}

output "sign_up_url" {
  description = "Public URL for the user registration route."
  value       = "${var.api_invoke_url}/auth/sign-up"
}

output "sign_in_url" {
  description = "Public URL for the sign-in route."
  value       = "${var.api_invoke_url}/auth/sign-in"
}

output "refresh_token_url" {
  description = "Public URL for the refresh-token route."
  value       = "${var.api_invoke_url}/auth/refresh-token"
}

output "cognito_jwt_authorizer_id" {
  description = "ID of the Cognito JWT authorizer for protected API routes."
  value       = aws_apigatewayv2_authorizer.cognito.id
}

output "forgot_password_url" {
  description = "Public URL for the forgot-password route."
  value       = "${var.api_invoke_url}/auth/forgot-password"
}

output "confirm_forgot_password_url" {
  description = "Public URL for the confirm-forgot-password route."
  value       = "${var.api_invoke_url}/auth/confirm-forgot-password"
}
