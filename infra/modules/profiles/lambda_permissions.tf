resource "aws_lambda_permission" "update_profile_from_api_gateway" {
  statement_id  = "AllowExecutionFrom${var.environment}PutUpdateProfileRoute"
  action        = "lambda:InvokeFunction"
  function_name = module.update_profile.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${var.api_execution_arn}/${var.api_stage_name}/PUT/profiles"

  lifecycle {
    create_before_destroy = true
  }
}
