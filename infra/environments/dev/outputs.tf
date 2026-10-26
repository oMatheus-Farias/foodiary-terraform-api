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

output "confirm_forgot_password_url" {
  description = "Public URL for the confirm-forgot-password route."
  value       = module.auth.confirm_forgot_password_url
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

output "list_meals_by_day_url" {
  description = "URL of the authenticated route for listing meals by day."
  value       = module.meals.list_meals_by_day_url
}

output "get_meal_by_id_url" {
  description = "URL of the authenticated get-meal-by-id route."
  value       = module.meals.get_meal_by_id_url
}

output "meals_cdn_domain_name" {
  description = "CloudFront domain serving objects from the meals bucket."
  value       = module.meals.meals_cdn_domain_name
}

output "get_me_url" {
  description = "URL of the authenticated get-me route."
  value       = module.accounts.get_me_url
}

output "update_profile_url" {
  description = "URL of the authenticated update-profile route."
  value       = module.profiles.update_profile_url
}

output "update_goal_url" {
  description = "URL of the authenticated update-goal route."
  value       = module.goals.update_goal_url
}
