data "aws_iam_policy_document" "update_profile_dynamodb" {
  statement {
    sid       = "ReadAndUpdateProfileInMainTable"
    actions   = ["dynamodb:GetItem", "dynamodb:UpdateItem"]
    resources = [var.main_table_arn]
  }
}

resource "aws_iam_role_policy" "update_profile_dynamodb" {
  name   = "${var.project_name}-${var.environment}-update-profile-dynamodb"
  policy = data.aws_iam_policy_document.update_profile_dynamodb.json
  role   = module.update_profile.execution_role_name
}
