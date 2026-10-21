resource "aws_apigatewayv2_integration" "create_meal" {
  api_id                 = var.api_id
  integration_type       = "AWS_PROXY"
  integration_method     = "POST"
  integration_uri        = module.create_meal.invoke_arn
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "create_meal" {
  api_id             = var.api_id
  route_key          = "POST /meals"
  authorization_type = "NONE"
  target             = "integrations/${aws_apigatewayv2_integration.create_meal.id}"

  depends_on = [aws_lambda_permission.create_meal_from_api_gateway]
}
