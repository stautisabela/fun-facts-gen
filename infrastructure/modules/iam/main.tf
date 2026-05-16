resource "aws_iam_role_policy_attachment" "dynamodb_read" {
  role       = var.lambda_role_name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBReadOnlyAccess"
}
