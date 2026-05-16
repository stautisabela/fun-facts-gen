output "invoke_arn" {
  description = "ARN used by API Gateway to invoke the Lambda function"
  value       = aws_lambda_function.fun_facts.invoke_arn
}

output "function_name" {
  description = "Name of the Lambda function"
  value       = aws_lambda_function.fun_facts.function_name
}

output "role_name" {
  description = "Name of the IAM role attached to the Lambda function"
  value       = aws_iam_role.fun_facts.name
}
