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
  authorization_type = "JWT"
  authorizer_id      = var.cognito_jwt_authorizer_id
  target             = "integrations/${aws_apigatewayv2_integration.create_meal.id}"

  depends_on = [aws_lambda_permission.create_meal_from_api_gateway]
}

resource "aws_apigatewayv2_integration" "list_meals_by_day" {
  api_id                 = var.api_id
  integration_type       = "AWS_PROXY"
  integration_method     = "POST"
  integration_uri        = module.list_meals_by_day.invoke_arn
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "list_meals_by_day" {
  api_id             = var.api_id
  route_key          = "GET /meals"
  authorization_type = "JWT"
  authorizer_id      = var.cognito_jwt_authorizer_id
  target             = "integrations/${aws_apigatewayv2_integration.list_meals_by_day.id}"

  depends_on = [aws_lambda_permission.list_meals_by_day_from_api_gateway]
}
