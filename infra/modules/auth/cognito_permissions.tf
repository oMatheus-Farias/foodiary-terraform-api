data "aws_iam_policy_document" "sign_up_cognito" {
  statement {
    sid       = "DeleteUserFromUserPool"
    actions   = ["cognito-idp:AdminDeleteUser"]
    resources = [aws_cognito_user_pool.main.arn]
  }
}

resource "aws_iam_role_policy" "sign_up_cognito" {
  name   = "${var.project_name}-${var.environment}-sign-up-cognito"
  policy = data.aws_iam_policy_document.sign_up_cognito.json
  role   = module.sign_up.execution_role_name
}
