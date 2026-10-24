resource "aws_lambda_permission" "get_me_from_api_gateway" {
  statement_id  = "AllowExecutionFrom${var.environment}GetMeRoute"
  action        = "lambda:InvokeFunction"
  function_name = module.get_me.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${var.api_execution_arn}/${var.api_stage_name}/GET/me"

  lifecycle {
    create_before_destroy = true
  }
}
