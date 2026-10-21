resource "aws_apigatewayv2_authorizer" "cognito" {
  api_id           = var.api_id
  name             = "${var.project_name}-${var.environment}-cognito-jwt"
  authorizer_type  = "JWT"
  identity_sources = ["$request.header.Authorization"]

  jwt_configuration {
    audience = [aws_cognito_user_pool_client.main.id]
    issuer   = "https://${aws_cognito_user_pool.main.endpoint}"
  }
}
