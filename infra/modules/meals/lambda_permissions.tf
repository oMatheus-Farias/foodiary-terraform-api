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

resource "aws_lambda_permission" "on_meal_file_uploaded_from_s3" {
  statement_id   = "AllowExecutionFromMealsBucketObjectCreated"
  action         = "lambda:InvokeFunction"
  function_name  = module.on_meal_file_uploaded.function_name
  principal      = "s3.amazonaws.com"
  source_arn     = aws_s3_bucket.meals.arn
  source_account = var.aws_account_id

  lifecycle {
    create_before_destroy = true
  }
}
