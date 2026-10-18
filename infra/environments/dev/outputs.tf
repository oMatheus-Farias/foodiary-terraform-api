output "sign_up_url" {
  description = "Public URL for the user registration route"
  value       = "${aws_apigatewayv2_stage.dev.invoke_url}/auth/sign-up"
}

output "pre_sign_up_trigger_function_name" {
  description = "Name of the Cognito pre-sign-up trigger Lambda function."
  value       = module.pre_sign_up_trigger.function_name
}
