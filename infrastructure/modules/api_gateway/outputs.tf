output "api_url" {
  description = "Invoke URL for the FunFactsAPI"
  value       = aws_apigatewayv2_stage.default.invoke_url
}
