data "aws_iam_policy_document" "sign_up_dynamodb" {
  statement {
    sid       = "PutItemsInMainTable"
    actions   = ["dynamodb:PutItem"]
    resources = [var.main_table_arn]
  }

  statement {
    sid       = "QueryAccountsByEmailInGsi1"
    actions   = ["dynamodb:Query"]
    resources = ["${var.main_table_arn}/index/GSI1"]
  }
}

resource "aws_iam_role_policy" "sign_up_dynamodb" {
  name   = "${var.project_name}-${var.environment}-sign-up-dynamodb"
  policy = data.aws_iam_policy_document.sign_up_dynamodb.json
  role   = module.sign_up.execution_role_name
}
