resource "aws_apigatewayv2_integration" "get_me" {
  api_id                 = var.api_id
  integration_type       = "AWS_PROXY"
  integration_method     = "POST"
  integration_uri        = module.get_me.invoke_arn
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "get_me" {
  api_id             = var.api_id
  route_key          = "GET /me"
  authorization_type = "JWT"
  authorizer_id      = var.cognito_jwt_authorizer_id
  target             = "integrations/${aws_apigatewayv2_integration.get_me.id}"

  depends_on = [aws_lambda_permission.get_me_from_api_gateway]
}
