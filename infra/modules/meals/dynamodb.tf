data "aws_iam_policy_document" "create_meal_dynamodb" {
  statement {
    sid       = "PutMealInMainTable"
    actions   = ["dynamodb:PutItem"]
    resources = [var.main_table_arn]
  }
}

resource "aws_iam_role_policy" "create_meal_dynamodb" {
  name   = "${var.project_name}-${var.environment}-create-meal-dynamodb"
  policy = data.aws_iam_policy_document.create_meal_dynamodb.json
  role   = module.create_meal.execution_role_name
}

data "aws_iam_policy_document" "list_meals_by_day_dynamodb" {
  statement {
    sid       = "QueryMealsByDayInGsi1"
    actions   = ["dynamodb:Query"]
    resources = ["${var.main_table_arn}/index/GSI1"]
  }
}

resource "aws_iam_role_policy" "list_meals_by_day_dynamodb" {
  name   = "${var.project_name}-${var.environment}-list-meals-by-day-dynamodb"
  policy = data.aws_iam_policy_document.list_meals_by_day_dynamodb.json
  role   = module.list_meals_by_day.execution_role_name
}

data "aws_iam_policy_document" "get_meal_by_id_dynamodb" {
  statement {
    sid       = "GetMealByIdInMainTable"
    actions   = ["dynamodb:GetItem"]
    resources = [var.main_table_arn]
  }
}

resource "aws_iam_role_policy" "get_meal_by_id_dynamodb" {
  name   = "${var.project_name}-${var.environment}-get-meal-by-id-dynamodb"
  policy = data.aws_iam_policy_document.get_meal_by_id_dynamodb.json
  role   = module.get_meal_by_id.execution_role_name
}

data "aws_iam_policy_document" "on_meal_file_uploaded_dynamodb" {
  statement {
    sid       = "ReadAndUpdateMealAfterUpload"
    actions   = ["dynamodb:GetItem", "dynamodb:UpdateItem"]
    resources = [var.main_table_arn]
  }
}

resource "aws_iam_role_policy" "on_meal_file_uploaded_dynamodb" {
  name   = "${var.project_name}-${var.environment}-on-meal-file-uploaded-dynamodb"
  policy = data.aws_iam_policy_document.on_meal_file_uploaded_dynamodb.json
  role   = module.on_meal_file_uploaded.execution_role_name
}

data "aws_iam_policy_document" "process_meal_dynamodb" {
  statement {
    sid       = "ReadAndUpdateMealDuringProcessing"
    actions   = ["dynamodb:GetItem", "dynamodb:UpdateItem"]
    resources = [var.main_table_arn]
  }
}

resource "aws_iam_role_policy" "process_meal_dynamodb" {
  name   = "${var.project_name}-${var.environment}-process-meal-dynamodb"
  policy = data.aws_iam_policy_document.process_meal_dynamodb.json
  role   = module.process_meal.execution_role_name
}
