module "api_gateway" {
  source = "../../modules/api_gateway"

  project_name = local.project_name
  environment  = var.environment
}

module "auth" {
  source = "../../modules/auth"

  project_name      = local.project_name
  environment       = var.environment
  api_id            = module.api_gateway.api_id
  api_execution_arn = module.api_gateway.execution_arn
  api_stage_name    = module.api_gateway.stage_name
  api_invoke_url    = module.api_gateway.invoke_url
  source_account_id = data.aws_caller_identity.current.account_id
  distribution_path = "${path.module}/../../../dist"
  main_table_arn    = module.dynamodb.table_arn
  main_table_name   = module.dynamodb.table_name

  ses_from_email_address = var.ses_from_email_address
  ses_identity_arn       = var.ses_identity_arn
}

module "dynamodb" {
  source = "../../modules/dynamodb"

  project_name = local.project_name
  environment  = var.environment
}

module "meals" {
  source = "../../modules/meals"

  project_name              = local.project_name
  environment               = var.environment
  aws_account_id            = data.aws_caller_identity.current.account_id
  api_id                    = module.api_gateway.api_id
  api_execution_arn         = module.api_gateway.execution_arn
  api_stage_name            = module.api_gateway.stage_name
  api_invoke_url            = module.api_gateway.invoke_url
  distribution_path         = "${path.module}/../../../dist"
  cognito_jwt_authorizer_id = module.auth.cognito_jwt_authorizer_id
  main_table_arn            = module.dynamodb.table_arn
  main_table_name           = module.dynamodb.table_name
}

module "accounts" {
  source = "../../modules/accounts"

  project_name              = local.project_name
  environment               = var.environment
  api_id                    = module.api_gateway.api_id
  api_execution_arn         = module.api_gateway.execution_arn
  api_stage_name            = module.api_gateway.stage_name
  api_invoke_url            = module.api_gateway.invoke_url
  distribution_path         = "${path.module}/../../../dist"
  cognito_jwt_authorizer_id = module.auth.cognito_jwt_authorizer_id
  main_table_arn            = module.dynamodb.table_arn
  main_table_name           = module.dynamodb.table_name
}

module "profiles" {
  source = "../../modules/profiles"

  project_name              = local.project_name
  environment               = var.environment
  api_id                    = module.api_gateway.api_id
  api_execution_arn         = module.api_gateway.execution_arn
  api_stage_name            = module.api_gateway.stage_name
  api_invoke_url            = module.api_gateway.invoke_url
  distribution_path         = "${path.module}/../../../dist"
  cognito_jwt_authorizer_id = module.auth.cognito_jwt_authorizer_id
  main_table_arn            = module.dynamodb.table_arn
  main_table_name           = module.dynamodb.table_name
}

module "goals" {
  source = "../../modules/goals"

  project_name              = local.project_name
  environment               = var.environment
  api_id                    = module.api_gateway.api_id
  api_execution_arn         = module.api_gateway.execution_arn
  api_stage_name            = module.api_gateway.stage_name
  api_invoke_url            = module.api_gateway.invoke_url
  distribution_path         = "${path.module}/../../../dist"
  cognito_jwt_authorizer_id = module.auth.cognito_jwt_authorizer_id
  main_table_arn            = module.dynamodb.table_arn
  main_table_name           = module.dynamodb.table_name
}
