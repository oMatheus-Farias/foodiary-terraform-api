data "archive_file" "hello" {
  type        = "zip"
  source_file = "${path.module}/../../../dist/hello.mjs"
  output_path = "${path.module}/../../../dist/hello.zip"
}
