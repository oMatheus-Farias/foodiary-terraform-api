output "sign_up_url" {
  description = "Public URL for the user registration route"
  value       = module.auth.sign_up_url
}

output "pre_sign_up_trigger_function_name" {
  description = "Name of the Cognito pre-sign-up trigger Lambda function."
  value       = module.auth.pre_sign_up_trigger_function_name
}
