data "aws_iam_policy_document" "get_me_dynamodb" {
  statement {
    sid       = "QueryProfileAndGoalFromMainTable"
    actions   = ["dynamodb:Query"]
    resources = [var.main_table_arn]
  }
}

resource "aws_iam_role_policy" "get_me_dynamodb" {
  name   = "${var.project_name}-${var.environment}-get-me-dynamodb"
  policy = data.aws_iam_policy_document.get_me_dynamodb.json
  role   = module.get_me.execution_role_name
}
