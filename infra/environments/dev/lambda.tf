resource "aws_lambda_function" "hello" {
  filename         = data.archive_file.hello.output_path
  function_name    = "foodiary-api-dev-hello"
  role             = aws_iam_role.hello.arn
  handler          = "hello.handler"
  runtime          = "nodejs24.x"
  architectures    = ["arm64"]
  memory_size      = 128
  timeout          = 3
  source_code_hash = data.archive_file.hello.output_base64sha256

  depends_on = [
    aws_cloudwatch_log_group.hello,
    aws_iam_role_policy.hello_logs,
  ]
}
