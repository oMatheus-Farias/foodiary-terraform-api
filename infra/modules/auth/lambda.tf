module "sign_up" {
  source = "../lambda"

  function_name         = "${var.project_name}-${var.environment}-sign-up"
  handler               = "signUp.handler"
  filename              = data.archive_file.sign_up.output_path
  source_code_hash      = data.archive_file.sign_up.output_base64sha256
  configure_environment = true
  timeout               = 10

  environment_variables = {
    COGNITO_CLIENT_ID     = aws_cognito_user_pool_client.main.id
    COGNITO_CLIENT_SECRET = aws_cognito_user_pool_client.main.client_secret
    COGNITO_POOL_ID       = aws_cognito_user_pool.main.id
    MAIN_TABLE_NAME       = var.main_table_name
  }
}

module "pre_sign_up_trigger" {
  source = "../lambda"

  function_name    = "${var.project_name}-${var.environment}-pre-sign-up-trigger"
  handler          = "preSignUpTrigger.handler"
  filename         = data.archive_file.pre_sign_up_trigger.output_path
  source_code_hash = data.archive_file.pre_sign_up_trigger.output_base64sha256
}

module "sign_in" {
  source = "../lambda"

  function_name    = "${var.project_name}-${var.environment}-sign-in"
  handler          = "signIn.handler"
  filename         = data.archive_file.sign_in.output_path
  source_code_hash = data.archive_file.sign_in.output_base64sha256

  configure_environment = true

  environment_variables = {
    COGNITO_CLIENT_ID     = aws_cognito_user_pool_client.main.id
    COGNITO_CLIENT_SECRET = aws_cognito_user_pool_client.main.client_secret
    COGNITO_POOL_ID       = aws_cognito_user_pool.main.id
    MAIN_TABLE_NAME       = var.main_table_name
  }
}

module "pre_token_generation_trigger" {
  source = "../lambda"

  function_name    = "${var.project_name}-${var.environment}-pre-token-generation-trigger"
  handler          = "preTokenGenerationTrigger.handler"
  filename         = data.archive_file.pre_token_generation_trigger.output_path
  source_code_hash = data.archive_file.pre_token_generation_trigger.output_base64sha256
}

module "refresh_token" {
  source = "../lambda"

  function_name         = "${var.project_name}-${var.environment}-refresh-token"
  handler               = "refreshToken.handler"
  filename              = data.archive_file.refresh_token.output_path
  source_code_hash      = data.archive_file.refresh_token.output_base64sha256
  timeout               = 10
  configure_environment = true

  environment_variables = {
    COGNITO_CLIENT_ID     = aws_cognito_user_pool_client.main.id
    COGNITO_CLIENT_SECRET = aws_cognito_user_pool_client.main.client_secret
  }
}

module "forgot_password" {
  source = "../lambda"

  function_name         = "${var.project_name}-${var.environment}-forgot-password"
  handler               = "forgotPassword.handler"
  filename              = data.archive_file.forgot_password.output_path
  source_code_hash      = data.archive_file.forgot_password.output_base64sha256
  timeout               = 10
  configure_environment = true

  environment_variables = {
    COGNITO_CLIENT_ID     = aws_cognito_user_pool_client.main.id
    COGNITO_CLIENT_SECRET = aws_cognito_user_pool_client.main.client_secret
  }
}
