output "sign_up_url" {
  description = "Public URL for the user registration route"
  value       = module.auth.sign_up_url
}

output "refresh_token_url" {
  description = "Public URL for the refresh-token route."
  value       = module.auth.refresh_token_url
}

output "forgot_password_url" {
  description = "Public URL for the forgot-password route."
  value       = module.auth.forgot_password_url
}

output "pre_sign_up_trigger_function_name" {
  description = "Name of the Cognito pre-sign-up trigger Lambda function."
  value       = module.auth.pre_sign_up_trigger_function_name
}

output "dynamodb_table_name" {
  description = "Name of the DynamoDB table used by the dev environment."
  value       = module.dynamodb.table_name
}

output "dynamodb_table_arn" {
  description = "ARN of the DynamoDB table used by the dev environment."
  value       = module.dynamodb.table_arn
}

output "create_meal_url" {
  description = "Public URL for the meal creation test route."
  value       = module.meals.create_meal_url
}
