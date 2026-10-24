data "aws_iam_policy_document" "create_meal_s3" {
  statement {
    sid       = "PutMealUploads"
    actions   = ["s3:PutObject"]
    resources = ["${aws_s3_bucket.meals.arn}/*"]
  }
}

resource "aws_iam_role_policy" "create_meal_s3" {
  name   = "${var.project_name}-${var.environment}-create-meal-s3"
  policy = data.aws_iam_policy_document.create_meal_s3.json
  role   = module.create_meal.execution_role_name
}
