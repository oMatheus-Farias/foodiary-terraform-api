resource "aws_cloudwatch_log_group" "api_access" {
  name              = "/aws/apigateway/${local.project_name}-${var.environment}/access"
  retention_in_days = 1
}
