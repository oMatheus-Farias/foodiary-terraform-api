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

resource "aws_apigatewayv2_integration" "refresh_token" {
  api_id                 = var.api_id
  integration_type       = "AWS_PROXY"
  integration_method     = "POST"
  integration_uri        = module.refresh_token.invoke_arn
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "refresh_token" {
  api_id             = var.api_id
  route_key          = "POST /auth/refresh-token"
  authorization_type = "NONE"
  target             = "integrations/${aws_apigatewayv2_integration.refresh_token.id}"

  depends_on = [aws_lambda_permission.refresh_token_from_api_gateway]
}

resource "aws_apigatewayv2_integration" "forgot_password" {
  api_id                 = var.api_id
  integration_type       = "AWS_PROXY"
  integration_method     = "POST"
  integration_uri        = module.forgot_password.invoke_arn
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "forgot_password" {
  api_id             = var.api_id
  route_key          = "POST /auth/forgot-password"
  authorization_type = "NONE"
  target             = "integrations/${aws_apigatewayv2_integration.forgot_password.id}"

  depends_on = [aws_lambda_permission.forgot_password_from_api_gateway]
}

resource "aws_apigatewayv2_integration" "confirm_forgot_password" {
  api_id                 = var.api_id
  integration_type       = "AWS_PROXY"
  integration_method     = "POST"
  integration_uri        = module.confirm_forgot_password.invoke_arn
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "confirm_forgot_password" {
  api_id             = var.api_id
  route_key          = "POST /auth/confirm-forgot-password"
  authorization_type = "NONE"
  target             = "integrations/${aws_apigatewayv2_integration.confirm_forgot_password.id}"

  depends_on = [aws_lambda_permission.confirm_forgot_password_from_api_gateway]
}
