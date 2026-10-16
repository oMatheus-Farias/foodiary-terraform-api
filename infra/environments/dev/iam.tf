data "aws_iam_policy_document" "lambda_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "hello" {
  name               = "foodiary-api-dev-hello"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role.json
}

data "aws_iam_policy_document" "hello_logs" {
  statement {
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = ["${aws_cloudwatch_log_group.hello.arn}:*"]
  }
}

resource "aws_iam_role_policy" "hello_logs" {
  name   = "foodiary-api-dev-hello-logs"
  role   = aws_iam_role.hello.id
  policy = data.aws_iam_policy_document.hello_logs.json
}
