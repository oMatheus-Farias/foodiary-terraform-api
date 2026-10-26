data "aws_iam_policy_document" "update_goal_dynamodb" {
  statement {
    sid       = "ReadAndUpdateGoalInMainTable"
    actions   = ["dynamodb:GetItem", "dynamodb:UpdateItem"]
    resources = [var.main_table_arn]
  }
}

resource "aws_iam_role_policy" "update_goal_dynamodb" {
  name   = "${var.project_name}-${var.environment}-update-goal-dynamodb"
  policy = data.aws_iam_policy_document.update_goal_dynamodb.json
  role   = module.update_goal.execution_role_name
}
