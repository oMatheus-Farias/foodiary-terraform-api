output "sign_up_url" {
  description = "Public URL for the user registration route"
  value       = "${aws_apigatewayv2_stage.dev.invoke_url}/auth/sign-up"
}
