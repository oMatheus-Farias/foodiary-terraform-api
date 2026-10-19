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
}
