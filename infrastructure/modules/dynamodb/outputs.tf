output "table_name" {
  description = "Name of the DynamoDB Facts table"
  value       = aws_dynamodb_table.facts.name
}
