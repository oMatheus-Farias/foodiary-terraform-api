resource "aws_lambda_function" "sign_up" {
  filename         = data.archive_file.sign_up.output_path
  function_name    = "${local.project_name}-${var.environment}-sign-up"
  role             = aws_iam_role.sign_up.arn
  handler          = "signUp.handler"
  runtime          = "nodejs24.x"
  architectures    = ["arm64"]
  memory_size      = 128
  timeout          = 3
  source_code_hash = data.archive_file.sign_up.output_base64sha256

  environment {
    variables = {
      COGNITO_CLIENT_ID     = aws_cognito_user_pool_client.main.id
      COGNITO_CLIENT_SECRET = aws_cognito_user_pool_client.main.client_secret
      COGNITO_POOL_ID       = aws_cognito_user_pool.main.id
    }
  }

  depends_on = [
    aws_cloudwatch_log_group.sign_up,
    aws_iam_role_policy.sign_up_logs,
  ]

  lifecycle {
    create_before_destroy = true
  }
}
