moved {
  from = aws_lambda_function.hello
  to   = aws_lambda_function.sign_up
}

moved {
  from = aws_iam_role.hello
  to   = aws_iam_role.sign_up
}

moved {
  from = aws_iam_role_policy.hello_logs
  to   = aws_iam_role_policy.sign_up_logs
}

moved {
  from = aws_cloudwatch_log_group.hello
  to   = aws_cloudwatch_log_group.sign_up
}

moved {
  from = aws_apigatewayv2_integration.hello
  to   = aws_apigatewayv2_integration.sign_up
}

moved {
  from = aws_lambda_permission.hello_from_api_gateway
  to   = aws_lambda_permission.sign_up_from_api_gateway
}

moved {
  from = aws_apigatewayv2_route.hello
  to   = aws_apigatewayv2_route.sign_up
}
