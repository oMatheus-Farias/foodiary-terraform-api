resource "aws_lambda_permission" "pre_sign_up_trigger_from_cognito" {
  statement_id   = "AllowExecutionFromCognitoPreSignUp"
  action         = "lambda:InvokeFunction"
  function_name  = module.pre_sign_up_trigger.function_name
  principal      = "cognito-idp.amazonaws.com"
  source_arn     = aws_cognito_user_pool.main.arn
  source_account = data.aws_caller_identity.current.account_id
}
