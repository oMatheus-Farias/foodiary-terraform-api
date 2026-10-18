resource "aws_apigatewayv2_api" "main" {
  name          = "${var.environment}-${local.project_name}"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "dev" {
  api_id      = aws_apigatewayv2_api.main.id
  name        = var.environment
  auto_deploy = true
  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.api_access.arn

    format = jsonencode({
      requestId      = "$context.requestId"
      sourceIp       = "$context.identity.sourceIp"
      requestTime    = "$context.requestTime"
      httpMethod     = "$context.httpMethod"
      routeKey       = "$context.routeKey"
      status         = "$context.status"
      responseLength = "$context.responseLength"
    })
  }
}

resource "aws_apigatewayv2_integration" "sign_up" {
  api_id                 = aws_apigatewayv2_api.main.id
  integration_type       = "AWS_PROXY"
  integration_method     = "POST"
  integration_uri        = aws_lambda_function.sign_up.invoke_arn
  payload_format_version = "2.0"
}

resource "aws_lambda_permission" "sign_up_from_api_gateway" {
  statement_id  = "AllowExecutionFrom${var.environment}PostAuthSignUpRoute"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.sign_up.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.main.execution_arn}/${aws_apigatewayv2_stage.dev.name}/POST/auth/sign-up"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_apigatewayv2_route" "sign_up" {
  api_id             = aws_apigatewayv2_api.main.id
  route_key          = "POST /auth/sign-up"
  authorization_type = "NONE"
  target             = "integrations/${aws_apigatewayv2_integration.sign_up.id}"

  depends_on = [aws_lambda_permission.sign_up_from_api_gateway]
}
