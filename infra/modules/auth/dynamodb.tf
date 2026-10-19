data "aws_iam_policy_document" "sign_up_dynamodb" {
  statement {
    actions   = ["dynamodb:PutItem"]
    resources = [var.main_table_arn]
  }
}

resource "aws_iam_role_policy" "sign_up_dynamodb" {
  name   = "${var.project_name}-${var.environment}-sign-up-dynamodb"
  policy = data.aws_iam_policy_document.sign_up_dynamodb.json
  role   = module.sign_up.execution_role_name
}
