resource "aws_lambda_permission" "create_meal_from_api_gateway" {
  statement_id  = "AllowExecutionFrom${var.environment}PostCreateMealRoute"
  action        = "lambda:InvokeFunction"
  function_name = module.create_meal.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${var.api_execution_arn}/${var.api_stage_name}/POST/meals"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lambda_permission" "list_meals_by_day_from_api_gateway" {
  statement_id  = "AllowExecutionFrom${var.environment}GetMealsByDayRoute"
  action        = "lambda:InvokeFunction"
  function_name = module.list_meals_by_day.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${var.api_execution_arn}/${var.api_stage_name}/GET/meals"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lambda_permission" "get_meal_by_id_from_api_gateway" {
  statement_id  = "AllowExecutionFrom${var.environment}GetMealByIdRoute"
  action        = "lambda:InvokeFunction"
  function_name = module.get_meal_by_id.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${var.api_execution_arn}/${var.api_stage_name}/GET/meals/*"

  lifecycle {
    create_before_destroy = true
  }
}
