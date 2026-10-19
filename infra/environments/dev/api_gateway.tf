resource "aws_apigatewayv2_integration" "sign_up" {
  api_id                 = module.api_gateway.api_id
  integration_type       = "AWS_PROXY"
  integration_method     = "POST"
  integration_uri        = module.sign_up.invoke_arn
  payload_format_version = "2.0"
}

resource "aws_lambda_permission" "sign_up_from_api_gateway" {
  statement_id  = "AllowExecutionFrom${var.environment}PostAuthSignUpRoute"
  action        = "lambda:InvokeFunction"
  function_name = module.sign_up.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${module.api_gateway.execution_arn}/${module.api_gateway.stage_name}/POST/auth/sign-up"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_apigatewayv2_route" "sign_up" {
  api_id             = module.api_gateway.api_id
  route_key          = "POST /auth/sign-up"
  authorization_type = "NONE"
  target             = "integrations/${aws_apigatewayv2_integration.sign_up.id}"

  depends_on = [aws_lambda_permission.sign_up_from_api_gateway]
}
