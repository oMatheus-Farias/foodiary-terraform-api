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

data "aws_iam_policy_document" "on_meal_file_uploaded_s3" {
  statement {
    sid       = "ReadMealUploadMetadata"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.meals.arn}/*"]
  }
}

resource "aws_iam_role_policy" "on_meal_file_uploaded_s3" {
  name   = "${var.project_name}-${var.environment}-on-meal-file-uploaded-s3"
  policy = data.aws_iam_policy_document.on_meal_file_uploaded_s3.json
  role   = module.on_meal_file_uploaded.execution_role_name
}
