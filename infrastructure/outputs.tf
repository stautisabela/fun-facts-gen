output "api_url" {
  description = "Invoke URL for FunFactsAPI — use this in index.html as API_URL"
  value       = module.api_gateway.api_url
}

output "lambda_role_name" {
  description = "IAM role name attached to the FunFacts Lambda (needed for later policy attachments)"
  value       = module.lambda.role_name
}
