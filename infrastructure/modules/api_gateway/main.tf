resource "aws_apigatewayv2_api" "fun_facts" {
  name          = "FunFactsAPI"
  protocol_type = "HTTP"
  description   = "HTTP API for the Fun Facts Generator"

  tags = {
    fun_fact = "true"
  }
}

resource "aws_apigatewayv2_integration" "lambda" {
  api_id                 = aws_apigatewayv2_api.fun_facts.id
  integration_type       = "AWS_PROXY"
  integration_uri        = var.lambda_invoke_arn
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "get_funfact" {
  api_id    = aws_apigatewayv2_api.fun_facts.id
  route_key = "GET /funfact"
  target    = "integrations/${aws_apigatewayv2_integration.lambda.id}"
}

resource "aws_apigatewayv2_stage" "default" {
  api_id      = aws_apigatewayv2_api.fun_facts.id
  name        = "$default"
  auto_deploy = true

  tags = {
    fun_fact = "true"
  }
}

resource "aws_lambda_permission" "api_gateway" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.fun_facts.execution_arn}/*/*/funfact"
}
