resource "aws_apigatewayv2_integration" "update_goal" {
  api_id                 = var.api_id
  integration_type       = "AWS_PROXY"
  integration_method     = "POST"
  integration_uri        = module.update_goal.invoke_arn
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "update_goal" {
  api_id             = var.api_id
  route_key          = "PUT /goals"
  authorization_type = "JWT"
  authorizer_id      = var.cognito_jwt_authorizer_id
  target             = "integrations/${aws_apigatewayv2_integration.update_goal.id}"

  depends_on = [aws_lambda_permission.update_goal_from_api_gateway]
}
