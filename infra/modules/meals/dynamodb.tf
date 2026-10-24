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
