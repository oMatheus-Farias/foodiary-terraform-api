output "hello_url" {
  description = "URL pública da rota temporária de teste"
  value       = "${aws_apigatewayv2_stage.dev.invoke_url}/hello"
}
