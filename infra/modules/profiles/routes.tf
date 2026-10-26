resource "aws_apigatewayv2_integration" "update_profile" {
  api_id                 = var.api_id
  integration_type       = "AWS_PROXY"
  integration_method     = "POST"
  integration_uri        = module.update_profile.invoke_arn
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "update_profile" {
  api_id             = var.api_id
  route_key          = "PUT /profiles"
  authorization_type = "JWT"
  authorizer_id      = var.cognito_jwt_authorizer_id
  target             = "integrations/${aws_apigatewayv2_integration.update_profile.id}"

  depends_on = [aws_lambda_permission.update_profile_from_api_gateway]
}
