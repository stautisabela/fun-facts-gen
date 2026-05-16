data "aws_iam_policy_document" "lambda_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "fun_facts" {
  name               = "FunFactsLambdaRole"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role.json

  tags = {
    fun_fact = "true"
  }
}

resource "aws_iam_role_policy_attachment" "basic_execution" {
  role       = aws_iam_role.fun_facts.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.root}/../src/lambda/handler.py"
  output_path = "${path.root}/../src/lambda/handler.zip"
}

resource "aws_lambda_function" "fun_facts" {
  function_name    = "FunFacts"
  role             = aws_iam_role.fun_facts.arn
  handler          = "handler.lambda_handler"
  runtime          = "python3.13"
  architectures    = ["x86_64"]
  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  tags = {
    fun_fact = "true"
  }
}
