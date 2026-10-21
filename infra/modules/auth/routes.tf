resource "aws_apigatewayv2_integration" "sign_up" {
  api_id                 = var.api_id
  integration_type       = "AWS_PROXY"
  integration_method     = "POST"
  integration_uri        = module.sign_up.invoke_arn
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "sign_up" {
  api_id             = var.api_id
  route_key          = "POST /auth/sign-up"
  authorization_type = "NONE"
  target             = "integrations/${aws_apigatewayv2_integration.sign_up.id}"

  depends_on = [aws_lambda_permission.sign_up_from_api_gateway]
}

resource "aws_apigatewayv2_integration" "sign_in" {
  api_id                 = var.api_id
  integration_type       = "AWS_PROXY"
  integration_method     = "POST"
  integration_uri        = module.sign_in.invoke_arn
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "sign_in" {
  api_id             = var.api_id
  route_key          = "POST /auth/sign-in"
  authorization_type = "NONE"
  target             = "integrations/${aws_apigatewayv2_integration.sign_in.id}"

  depends_on = [aws_lambda_permission.sign_in_from_api_gateway]
}
