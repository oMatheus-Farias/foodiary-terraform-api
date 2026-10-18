data "aws_iam_policy_document" "lambda_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "sign_up" {
  name               = "${local.project_name}-${var.environment}-sign-up"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role.json
}

data "aws_iam_policy_document" "sign_up_logs" {
  statement {
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = ["${aws_cloudwatch_log_group.sign_up.arn}:*"]
  }
}

resource "aws_iam_role_policy" "sign_up_logs" {
  name   = "${local.project_name}-${var.environment}-sign-up-logs"
  role   = aws_iam_role.sign_up.id
  policy = data.aws_iam_policy_document.sign_up_logs.json
}
