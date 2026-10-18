module "sign_up" {
  source = "../../modules/lambda"

  function_name         = "${local.project_name}-${var.environment}-sign-up"
  handler               = "signUp.handler"
  filename              = data.archive_file.sign_up.output_path
  source_code_hash      = data.archive_file.sign_up.output_base64sha256
  configure_environment = true

  environment_variables = {
    COGNITO_CLIENT_ID     = aws_cognito_user_pool_client.main.id
    COGNITO_CLIENT_SECRET = aws_cognito_user_pool_client.main.client_secret
    COGNITO_POOL_ID       = aws_cognito_user_pool.main.id
  }
}

module "pre_sign_up_trigger" {
  source = "../../modules/lambda"

  function_name    = "${local.project_name}-${var.environment}-pre-sign-up-trigger"
  handler          = "preSignUpTrigger.handler"
  filename         = data.archive_file.pre_sign_up_trigger.output_path
  source_code_hash = data.archive_file.pre_sign_up_trigger.output_base64sha256
}
