resource "aws_lambda_permission" "update_goal_from_api_gateway" {
  statement_id  = "AllowExecutionFrom${var.environment}PutUpdateGoalRoute"
  action        = "lambda:InvokeFunction"
  function_name = module.update_goal.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${var.api_execution_arn}/${var.api_stage_name}/PUT/goals"

  lifecycle {
    create_before_destroy = true
  }
}
