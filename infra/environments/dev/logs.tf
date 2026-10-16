resource "aws_cloudwatch_log_group" "hello" {
  name              = "/aws/lambda/foodiary-api-dev-hello"
  retention_in_days = 1
}
