module "api_gateway" {
  source = "../../modules/api_gateway"

  project_name = local.project_name
  environment  = var.environment
}
