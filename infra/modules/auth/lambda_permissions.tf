resource "aws_lambda_permission" "pre_sign_up_trigger_from_cognito" {
  statement_id   = "AllowExecutionFromCognitoPreSignUp"
  action         = "lambda:InvokeFunction"
  function_name  = module.pre_sign_up_trigger.function_name
  principal      = "cognito-idp.amazonaws.com"
  source_arn     = aws_cognito_user_pool.main.arn
  source_account = var.source_account_id
}

resource "aws_lambda_permission" "sign_up_from_api_gateway" {
  statement_id  = "AllowExecutionFrom${var.environment}PostAuthSignUpRoute"
  action        = "lambda:InvokeFunction"
  function_name = module.sign_up.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${var.api_execution_arn}/${var.api_stage_name}/POST/auth/sign-up"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lambda_permission" "sign_in_from_api_gateway" {
  statement_id  = "AllowExecutionFrom${var.environment}PostAuthSignInRoute"
  action        = "lambda:InvokeFunction"
  function_name = module.sign_in.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${var.api_execution_arn}/${var.api_stage_name}/POST/auth/sign-in"

  lifecycle {
    create_before_destroy = true
  }
}
